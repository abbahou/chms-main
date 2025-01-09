package bdio.chms.chms.controllers;

import bdio.chms.chms.models.Medicament;
import javafx.beans.property.SimpleObjectProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import bdio.chms.chms.dao.MedicationService;

import java.awt.event.ActionEvent;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

public class FournisseurController {

    @FXML
    private TableView<Medicament> medicamentTable;

    @FXML
    private TableColumn<Medicament, String> nomColumn;

    @FXML
    private TableColumn<Medicament, Integer> qtyColumn;

    @FXML
    private TableColumn<Medicament, Double> prixColumn;

    @FXML
    private Button viewMedicationButton;

    @FXML
    private Button dashboardButton;

    @FXML
    private Button calendarButton;

    @FXML
    private Button settingsButton;

    @FXML
    private Button profileButton;

    @FXML
    private VBox tableContainer;

    @FXML
    private TextField quantiteTextField;

    private MedicationService medicationService;

    private static final AtomicInteger idCounter = new AtomicInteger(1); // Counter for incrementing ID

    @FXML
    private void initialize() {
        System.out.println("Initialisation du contrôleur...");
        medicationService = new MedicationService();

        nomColumn.setCellValueFactory(cellData -> new SimpleObjectProperty<> ( cellData.getValue().getNomMed()));
        qtyColumn.setCellValueFactory(cellData -> new SimpleObjectProperty<> (cellData.getValue().getQty()));
        prixColumn.setCellValueFactory(cellData -> new SimpleObjectProperty<>(cellData.getValue().getPrixUnit()));

        chargerMedicaments();
    }

    private void chargerMedicaments() {
        if (medicamentTable != null) {
            ObservableList<Medicament> medicaments = FXCollections.observableArrayList(medicationService.getAllMedications());
            medicamentTable.setItems(medicaments);
        } else {
            System.err.println("medicamentTable is null!");
        }
    }

    @FXML
    public void augmenterQuantite(javafx.event.ActionEvent actionEvent) {
        Medicament selectedMedicament = medicamentTable.getSelectionModel().getSelectedItem();

        if (selectedMedicament != null) {
            try {
                int quantiteAjout = Integer.parseInt(quantiteTextField.getText());

                medicationService.updateQuantite(selectedMedicament.getIdMedicament(), quantiteAjout);
                selectedMedicament.setQty(selectedMedicament.getQty() + quantiteAjout);
                medicamentTable.refresh();
                quantiteTextField.clear();
            } catch (NumberFormatException e) {
                System.err.println("La quantité doit être un entier valide.");
            }
        }
    }



    @FXML
    private Node sidebar;

    private Stage stage;
    private Scene scene;
    private Parent root;

    // Method to load views dynamically into the dashboard content area

    private void loadView(String fxmlFile, javafx.event.ActionEvent event) {
        try {
            // Load the FXML file
            FXMLLoader loader = new FXMLLoader(getClass().getResource(fxmlFile));
            root = loader.load();

            // Get the current stage and set the new scene
            stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            scene = new Scene(root);

            // Manage sidebar visibility based on the view being loaded
            manageSidebarVisibility(fxmlFile);

            // Set the scene to the stage and show it
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            System.err.println("Error loading view: " + fxmlFile);
            e.printStackTrace();
        }
    }


    private void manageSidebarVisibility(String fxmlFile) {
        if (sidebar != null) {
            boolean isSidebarVisible = fxmlFile.equals("/bdio/chms/chms/fxml/Dashboard.fxml") ||
                    fxmlFile.equals("/bdio/chms/chms/fxml/Medicament.fxml");
            sidebar.setVisible(isSidebarVisible);
        }
    }



    @FXML
    private void goToProfile(javafx.event.ActionEvent event) {
        loadView("/bdio/chms/chms/fxml/Profile.fxml", event);
    }

    @FXML
    private void goToDashboard(javafx.event.ActionEvent event) {
        loadView("/bdio/chms/chms/fxml/Dashboard.fxml", event);
    }

    @FXML
    private void showViewMedication(javafx.event.ActionEvent event) {
        loadView("/bdio/chms/chms/fxml/Medicament.fxml", event);
    }

    @FXML
    private void goToOrdonnance(javafx.event.ActionEvent event) {
        loadView("/bdio/chms/chms/fxml/Ordonnance.fxml", event);
    }

    @FXML
    private void goToFournisseur(javafx.event.ActionEvent event) {
        loadView("/bdio/chms/chms/fxml/Fournisseur.fxml", event);
    }
    @FXML
    private void goToLogin(javafx.event.ActionEvent event) {
        loadView("/bdio/chms/chms/fxml/Login.fxml", event);
    }


}
