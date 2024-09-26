#include <stdio.h>
#include <gtk/gtk.h>

// Activate function
static void activate(GtkApplication *app, gpointer user_data)
{
    // Variables/Widgets
    GtkWidget *window;
    GtkWidget *box;
    GtkWidget *button1, *button2;

    // Creating the window
    window = gtk_application_window_new(app);
    // === WINDOW SETTINGS ===
    // If someone use window decoration on hyprland, displaying a proper title
    gtk_window_set_title(GTK_WINDOW(window), "HyprSettings");
    // Resizable ? NO
    gtk_window_set_resizable(GTK_WINDOW(window), FALSE);
    // So we set a proper format
    gtk_window_set_default_size(GTK_WINDOW(window), 500, 700);




    // Creating a box to store widgets
    box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    // 2 parts in our box
    button1 = gtk_button_new_with_label("button1");
    button2 = gtk_button_new_with_label("button2");

    // adding box to window
    gtk_container_add(GTK_CONTAINER(window), box);

    // ADDING BUTTONS TO THE BOX
    gtk_box_pack_start(GTK_BOX(box), button1, TRUE, TRUE, 50);
    gtk_box_pack_start(GTK_BOX(box), button2, TRUE, TRUE, 50);




    // Showing the window
    gtk_widget_show_all(window);
}

int main(int argc, char** argv)
{
    // Variables
    int ret_code;

    // Creating a gtk app object
    GtkApplication *app;

    // Setting up our gtk app object 
    app = gtk_application_new("dragono.hyprsettings", G_APPLICATION_DEFAULT_FLAGS);

    // Function to call when we "activate" our application
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);

    // Run the app
    ret_code=g_application_run(G_APPLICATION(app), argc, argv);

    // Destroying app to free memory ?
    g_object_unref(app);

    // Returning code
    return ret_code;
}