//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import MapKit
import Lima

class MapViewController: UIViewController, UITextFieldDelegate {
    var mapView: MKMapView!
    var latitudeTextField: UITextField!
    var longitudeTextField: UITextField!

    let radius = 250.0

    override func loadView() {
        mapView = MKMapView()

        mapView.weight = 1
        mapView.layer.borderWidth = 0.5
        mapView.layer.borderColor = UIColor.lightGray.cgColor

        view = LMColumnView(margin: 16, backgroundColor: UIColor.white,
            mapView,
            LMRowView(
                UITextField(placeholder: "Latitude",
                    borderStyle: .roundedRect,
                    keyboardType: .numbersAndPunctuation,
                    autocorrectionType: .no,
                    autocapitalizationType: .none,
                    weight: 1) { self.latitudeTextField = $0 },
                UITextField(placeholder: "Longitude",
                    borderStyle: .roundedRect,
                    keyboardType: .numbersAndPunctuation,
                    autocorrectionType: .no,
                    autocapitalizationType: .none,
                    weight: 1) { self.longitudeTextField = $0 }
            ),
            UIButton(type: .system, title: "Go") { button in
                button.addTarget(self, action: #selector(self.showLocation), for: .primaryActionTriggered)
            }
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewRespectsSystemMinimumLayoutMargins = false

        latitudeTextField.delegate = self
        longitudeTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let defaultNotificationCenter = NotificationCenter.default

        defaultNotificationCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        defaultNotificationCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)

        latitudeTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        showLocation()

        return false
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

        view.bottomMargin = frame.height
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        view.bottomMargin = 0
    }

    @objc func showLocation() {
        let latitude = Double(latitudeTextField.text ?? "") ?? 0
        let longitude = Double(longitudeTextField.text ?? "") ?? 0

        if (latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                latitudinalMeters: radius * 1000, longitudinalMeters: radius * 1000)

            if (region.center.latitude + region.span.latitudeDelta <= 90
                && region.center.latitude - region.span.latitudeDelta >= -90) {
                mapView.setRegion(region, animated: true)
            }
        }
    }
}
