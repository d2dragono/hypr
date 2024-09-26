#include <gtk/gtk.h>

int main(int argc, char** argv)
{
    if(argc < 3)
    {
        printf("Usage: ./gladeLauncher {path/to/glade/file} {main-window-name}\n");
	return 1;
    }

    // Window and builder
    GtkWidget *window;
    GtkBuilder *builder;

    // Initialize GTK+
    gtk_init(&argc, &argv);

    // Load the Glade file
    builder = gtk_builder_new();
    GError *error = NULL;
    gtk_builder_add_from_file(builder, argv[1], &error);
    if (error != NULL) {
        g_error_free(error);
	printf("an error occured\n");
        return 1; // Error loading Glade file
    }

    // Get the window object from the Glade file
    window = GTK_WIDGET(gtk_builder_get_object(builder, argv[2]));

    // End App on close
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    // Show the window and start the GTK+ main loop
    gtk_widget_show(window);
    gtk_main();

    return 0;
}
