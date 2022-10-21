//********************************************************************************
// Copyright (c) 2022 Dilshan R Jayakody.
// 6-channel sound processor - control panel.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//********************************************************************************

#include <gtk/gtk.h>

#include "common.h"
#include "guidef.h"

#include "main.h"
#include "devcnt.h"
#include "pt2322.h"
#include "logger.h"

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>

audioSettings audioData;
commInfo commInfoData;

pthread_t controlThreadId;

#define GUI_CNT_MASTER_VOLUME   "scaleMasterVol"

#define GUI_CNT_TRIM_FRONT_LEFT     "scaleFLVolume"
#define GUI_CNT_TRIM_FRONT_RIGHT    "scaleFRVolume"
#define GUI_CNT_TRIM_REAR_LEFT      "scaleRLVolume"
#define GUI_CNT_TRIM_REAR_RIGHT     "scaleRRVolume"
#define GUI_CNT_TRIM_CENTER         "scaleCenVolume"
#define GUI_CNT_TRIM_SUBWOOFER      "scaleSubVolume"

#define GUI_CNT_TONE_BASS   "scaleBass"
#define GUI_CNT_TONT_TREBLE "scaleTreble"
#define GUI_CNT_TONE_MID    "scaleMid"

int main(int argc, char* argv [])
{
    GtkBuilder *builder; 
    GdkPixbuf *pixBuffer;

    printLogInfo("Starting application...");

    // Initialize common data structures.
    commInfoData.serialIntf = -1;
    commInfoData.audioControlData = &audioData;    
    commInfoData.masterVolumeEvent = masterVolumeChangedOnDev;
    commInfoData.trimChannelVolumeEvent = trimLevelChangedOnDev;
    commInfoData.toneLevelEvent = toneLevelChangedOnDev;
    commInfoData.effectEvent = effectChangedOnDev;

    // Initialize the GTK library.
    gtk_init(&argc, &argv);

    // Load main window from GLADE file and build the object.
    builder = gtk_builder_new_from_file("glade/6ch-sound-fx.glade");
    mainWindow.winMain = GTK_WIDGET(gtk_builder_get_object(builder, "appwinMain"));
    
    // Set window icon.
    pixBuffer = gdk_pixbuf_new_from_resource("/com/dilshan/6chafx/appicon", NULL);
    gtk_window_set_icon(GTK_WINDOW(mainWindow.winMain), pixBuffer);
    
    // Update control names to identify the common control events.
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleMasterVol")), GUI_CNT_MASTER_VOLUME);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleFLVolume")), GUI_CNT_TRIM_FRONT_LEFT);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleRLVolume")), GUI_CNT_TRIM_REAR_LEFT);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleFRVolume")), GUI_CNT_TRIM_FRONT_RIGHT);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleRRVolume")), GUI_CNT_TRIM_REAR_RIGHT);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleCenVolume")), GUI_CNT_TRIM_CENTER);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleSubVolume")), GUI_CNT_TRIM_SUBWOOFER);

    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleBass")), GUI_CNT_TONE_BASS);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleMid")), GUI_CNT_TONE_MID);
    gtk_widget_set_name(GTK_WIDGET(gtk_builder_get_object(builder, "scaleTreble")), GUI_CNT_TONT_TREBLE);

    mainWindow.txtSerialFile = GTK_ENTRY(gtk_builder_get_object(builder, "txtSerialFile"));
    mainWindow.btnConnect = GTK_BUTTON(gtk_builder_get_object(builder, "btnConnect"));
    mainWindow.adjMasterVolume = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimMaster"));

    mainWindow.trimFrontLeft = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimFL"));
    mainWindow.trimFrontRight = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimFR"));
    mainWindow.trimRearLeft = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimRL"));
    mainWindow.trimRearRight = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimRR"));
    mainWindow.trimCenter = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimCenter"));
    mainWindow.trimSubwoofer = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTrimSub")); 

    mainWindow.toneBass = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjBass"));
    mainWindow.toneMid = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjMid"));
    mainWindow.toneTreble = GTK_ADJUSTMENT(gtk_builder_get_object(builder, "adjTreble"));

    mainWindow.effect3D = GTK_CHECK_BUTTON(gtk_builder_get_object(builder, "chk3d"));
    mainWindow.effectTone = GTK_CHECK_BUTTON(gtk_builder_get_object(builder, "chkTone"));

    mainWindow.grdVolume = GTK_WIDGET(gtk_builder_get_object(builder, "grdVolume"));
    mainWindow.grdTone = GTK_WIDGET(gtk_builder_get_object(builder, "grdTone"));

    gtk_builder_connect_signals(builder, NULL);

    // Release builder.
    g_object_unref(builder);

    printLogInfo("Finish loading all window objects");

    // Set main window properties.
    gtk_window_set_title(GTK_WINDOW(mainWindow.winMain), "Sound Fx Manager");

    // Set default UI behaviours.
    gtk_entry_set_placeholder_text(mainWindow.txtSerialFile, "/dev/ttyUSB0");
    
    // Show main application window.
    gtk_widget_show(mainWindow.winMain);  
    gtk_main();

    return 0;
}

void on_appwinMain_destroy()
{
    // Close open serial session.
    if(commInfoData.serialIntf > -1)
    {
        printLogInfo("Closing the serial session");

        close(commInfoData.serialIntf);
        commInfoData.serialIntf = -1;
    }
    
    // Terminate application.    
    gtk_main_quit();
}

void on_adjTrimMaster_value_changed(GtkAdjustment* self, gpointer user_data)
{
    audioData.master = PT2322_MASTER_VOLUME_MIN - (gtk_adjustment_get_value(self));
}

void on_chkTone_toggled(GtkToggleButton *togglebutton, gpointer user_data)
{
    audioData.isToneDisable = !gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(togglebutton));
}

void on_chk3d_toggled(GtkToggleButton *togglebutton, gpointer user_data)
{
    audioData.is3DDisable = !gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(togglebutton));
}

void on_adjTrimSubChannel_value_changed(GtkAdjustment* self, gpointer user_data)
{
    const gchar *adjControl = gtk_widget_get_name(GTK_WIDGET(user_data));
    unsigned char adjValue = PT2322_TRIM_MIN - (gtk_adjustment_get_value(self));

    if(strcmp(adjControl, GUI_CNT_TRIM_FRONT_LEFT) == 0)
    {
        audioData.trimSettings.frontLeft = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TRIM_FRONT_RIGHT) == 0)
    {
        audioData.trimSettings.frontRight = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TRIM_REAR_LEFT) == 0)
    {
        audioData.trimSettings.rearLeft = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TRIM_REAR_RIGHT) == 0)
    {
        audioData.trimSettings.rearRight = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TRIM_CENTER) == 0)
    {
        audioData.trimSettings.center = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TRIM_SUBWOOFER) == 0)
    {
        audioData.trimSettings.subwoofer = adjValue;
    }
    else
    {
        // This block should not reachable!
        printLogError("Unknown trim control ID.");
    }
}

void on_adjTone_value_changed(GtkAdjustment* self, gpointer user_data)
{
    const gchar *adjControl = gtk_widget_get_name(GTK_WIDGET(user_data));
    unsigned char adjValue = gtk_adjustment_get_value(self);

    if(strcmp(adjControl, GUI_CNT_TONE_BASS) == 0)
    {
        audioData.toneSettings.bass = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TONT_TREBLE) == 0)
    {
        audioData.toneSettings.treble = adjValue;
    }
    else if(strcmp(adjControl, GUI_CNT_TONE_MID) == 0)
    {
        audioData.toneSettings.mid = adjValue;
    }
    else
    {
        // This block should not reachable!
        printLogError("Unknown tone control ID.");
    }
}

void on_btnConnect_pressed(GtkButton *button, gpointer user_data)
{    
    // Extracting and validating serial interface path.
    int threadStatus;
    const gchar* serialPortPath;
    GtkWidget* msgDlg;

    gtk_widget_set_sensitive(GTK_WIDGET(button), FALSE);
    gtk_widget_set_sensitive(GTK_WIDGET(mainWindow.txtSerialFile), FALSE);
    gtk_editable_set_editable(GTK_EDITABLE(mainWindow.txtSerialFile), FALSE);

    serialPortPath = gtk_entry_get_text(GTK_ENTRY(mainWindow.txtSerialFile));
    if(serialPortPath != NULL)
    {
        if(strlen(serialPortPath) > 0)
        {
            // Check the availability of the file and its permissions.
            if(access(serialPortPath, (R_OK | W_OK | F_OK)) == 0)
            {
                commInfoData.serialIntf = createSerialSession(serialPortPath);
                if(commInfoData.serialIntf == -1)
                {
                    // Unable to create serial session on the given path.
                    msgDlg = gtk_message_dialog_new(GTK_WINDOW(mainWindow.winMain), GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_OK, "Unable to create serial session");
                    gtk_dialog_run(GTK_DIALOG(msgDlg));
                    gtk_widget_destroy(msgDlg);
                }

                // Checking for valid device by sending a ping request to the device!
                if(isValidDevice(&commInfoData))
                {
                    printLogInfo("Create serial session successfully");

                    // Create control thread to transfer settings to the device.                
                    threadStatus = pthread_create(&controlThreadId, NULL, &controlThreadHandler, &commInfoData);
                    if(threadStatus)
                    {
                        // Unable to create control thread.
                        printLogError("Unable to create control thread");

                        msgDlg = gtk_message_dialog_new(GTK_WINDOW(mainWindow.winMain), GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_OK, "Unable to create control thread.\n\n%s", g_strerror(errno));
                        gtk_dialog_run(GTK_DIALOG(msgDlg));
                        gtk_widget_destroy(msgDlg);
                    }

                    // Enable tone and volume grids for user input.
                    gtk_widget_set_sensitive(mainWindow.grdVolume, TRUE);
                    gtk_widget_set_sensitive(mainWindow.grdTone, TRUE);

                    // Successfully establish a link with the device.
                    return;
                }
                else
                {
                    // The device attached to the port is not responding or invalid.
                    msgDlg = gtk_message_dialog_new(GTK_WINDOW(mainWindow.winMain), GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_WARNING, GTK_BUTTONS_OK, "Device is not responding or unidentified device.");
                    gtk_dialog_run(GTK_DIALOG(msgDlg));
                    gtk_widget_destroy(msgDlg);
                }
            }
            else
            {
                // Unable to find the specified file or required permission are not available.
                msgDlg = gtk_message_dialog_new(GTK_WINDOW(mainWindow.winMain), GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_OK, "Unable to open the specified serial interface.\n\n%s", g_strerror(errno));
                gtk_dialog_run(GTK_DIALOG(msgDlg));
                gtk_widget_destroy(msgDlg);
            }
        }
        else
        {
            // Serial interface path is not specified by the user.
            msgDlg = gtk_message_dialog_new(GTK_WINDOW(mainWindow.winMain), GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_WARNING, GTK_BUTTONS_OK, "Serial interface path is not specified.");
            gtk_dialog_run(GTK_DIALOG(msgDlg));
            gtk_widget_destroy(msgDlg);

            // Set focus to the required field.
            gtk_widget_grab_focus(GTK_WIDGET(mainWindow.txtSerialFile));
        }
    }

    // Reactivate input controls.
    gtk_widget_set_sensitive(GTK_WIDGET(button), TRUE);
    gtk_widget_set_sensitive(GTK_WIDGET(mainWindow.txtSerialFile), FALSE);
    gtk_editable_set_editable(GTK_EDITABLE(mainWindow.txtSerialFile), TRUE);
}

void on_txtSerialFile_activate(GtkEntry *entry, gpointer  user_data)
{
    on_btnConnect_pressed(mainWindow.btnConnect, user_data);
}

void masterVolumeChangedOnDev(unsigned char newLevel)
{
    audioData.master = newLevel;
    gtk_adjustment_set_value(mainWindow.adjMasterVolume, (PT2322_MASTER_VOLUME_MIN - newLevel));
}

void trimLevelChangedOnDev(enum ControlID cID, unsigned char newLevel)
{    
    GtkAdjustment *adjControl = NULL;

    switch(cID)
    {
        case CID_TRIM_FRONT_LEFT:
            adjControl = mainWindow.trimFrontLeft;
            break;
        case CID_TRIM_FRONT_RIGHT:
            adjControl = mainWindow.trimFrontRight;
            break;
        case CID_TRIM_REAR_LEFT:
            adjControl = mainWindow.trimRearLeft;
            break;
        case CID_TRIM_REAR_RIGHT:
            adjControl = mainWindow.trimRearRight;
            break;
        case CID_CENTER:
            adjControl = mainWindow.trimCenter;
            break;
        case CID_SUBWOOFER:
            adjControl = mainWindow.trimSubwoofer;
            break;
        default:
    }

    if(adjControl != NULL)
    {
        gtk_adjustment_set_value(adjControl, (PT2322_TRIM_MIN - newLevel));
    }
}

void toneLevelChangedOnDev(enum ControlID cID, unsigned char newLevel)
{
    GtkAdjustment *adjControl = NULL;

    switch(cID)
    {
        case CID_BASS:
            adjControl = mainWindow.toneBass;
            break;
        case CID_MID:
            adjControl = mainWindow.toneMid;
            break;
        case CID_TREBLE:
            adjControl = mainWindow.toneTreble;
            break;
        default:
    }

    if(adjControl != NULL)
    {
        gtk_adjustment_set_value(adjControl, newLevel);
    }
}

void effectChangedOnDev(enum ControlID cID, gboolean newState)
{
    GtkCheckButton *chkControl = NULL;

    if(cID == CID_3DFX)
    {
        chkControl = mainWindow.effect3D;
    }
    else if(cID == CID_TONE)
    {
        chkControl = mainWindow.effectTone;
    }

    if(chkControl != NULL)
    {
        gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(chkControl), !newState);
    }
}

gboolean isValidDevice(commInfo *comIntf)
{
    unsigned char tryCount = 0;
    char pingReq[7], regStatus[4] = {[0 ... 3] = 0};
    ssize_t status;

    if(comIntf != NULL)
    {
        sprintf(pingReq, "%s", PING_CMD_DEV_ID);
                
        // Try to identify the target device by sending the ping command multipal times.
        while (tryCount < DEV_ID_TRY_COUNT)
        {
            // Send ping command to the specified serial port/device.
            status = write(comIntf->serialIntf, pingReq, sizeof(pingReq));
            usleep(50);

            if(status >= sizeof(pingReq))
            {                
                status = read(comIntf->serialIntf, regStatus, 3);
                if(status > 0)
                {
                    regStatus[3] = 0;

                    // Check for successful reponse from the device.
                    if(strcmp(regStatus, CNT_ACK) == 0)
                    {                    
                        printLogInfo("Got successful response from the device");
                        return TRUE;
                    }
                }

                printLogInfo("Device ping command fail with error");
            }
            else
            {
                // Allow sometime to respond the device on the serial port.
                usleep(100);
            }

            tryCount++;
        }
    }

    // Device not found on the specified serial port!
    return FALSE;
}

int createSerialSession(const char *serialPath)
{
    int result;
    struct termios ttySession;

    result= open(serialPath, O_RDWR);

    // Get existing terminal attributes.
    if(tcgetattr(result, &ttySession) != 0)
    {
        // Unable to read existing terminal attributes.
        printLogError("Unable to read terminal attributes");
        return -1;
    }

    // Set serial session with no parity bit, one stop bit and without hardware flow control.
    ttySession.c_cflag = ttySession.c_cflag & (~(PARENB | CSTOPB | CSIZE | CRTSCTS));

    // Set 8-bits per byte, enable read and not to check carrier signal.
    ttySession.c_cflag = ttySession.c_cflag | (CS8 | CREAD | CLOCAL);

    // Turn off canonical mode, echo, new-line echo, erasure.
    ttySession.c_lflag = ttySession.c_lflag & (~(ICANON | ECHO | ECHOE | ECHONL | ISIG));

    // Disable software flow control and handling the receiving byte stream.
    ttySession.c_iflag = ttySession.c_iflag & (~(IXON | IXOFF | IXANY | IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL ));

    // Disable converting newline to carriage return/line feed and handling the outgoing byte stream.
    ttySession.c_oflag = ttySession.c_oflag & (~(OPOST | ONLCR));

    // Wait time configuration. 
    // http://unixwiz.net/techtips/termios-vmin-vtime.html
    ttySession.c_cc[VTIME] = 5;
    ttySession.c_cc[VMIN] = 0;

    // Set I/O baud rates.
    cfsetispeed(&ttySession, B38400);
    cfsetospeed(&ttySession, B38400);

    // Set new terminal attributes.
    if (tcsetattr(result, TCSANOW, &ttySession) != 0)
    {
        // Unable to set new terminal attributes.
        printLogError("Unable to set terminal attributes");
        return -1;
    }

    // Flush the content in serial buffer.
    usleep(20000);
    tcflush(result, TCIOFLUSH);

    return result;
}