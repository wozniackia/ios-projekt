import SwiftUI
import CoreData
import UIKit


struct Dog {
    let name: String
    let age: Int
    let image: UIImage
}

class FirstViewController: UIViewController {
    private var dogs: [Dog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pobierz dane o psach
        fetchDogs()
        
        // Ustawienie tła widoku
        view.backgroundColor = .white
        
        // Tworzenie kontenera przewijania
        let scrollView = UIScrollView(frame: view.bounds)
        
        // Tworzenie kafelków z danymi psów
        var tileY: CGFloat = 20
        for dog in dogs {
            let tileView = UIView(frame: CGRect(x: 20, y: tileY, width: view.frame.width - 40, height: 120))
            tileView.backgroundColor = .lightGray
            tileView.layer.cornerRadius = 8
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
            imageView.image = dog.image
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 8
            imageView.clipsToBounds = true
            
            let nameLabel = UILabel(frame: CGRect(x: 120, y: 10, width: tileView.frame.width - 130, height: 30))
            nameLabel.text = dog.name
            nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
            
            let ageLabel = UILabel(frame: CGRect(x: 120, y: 50, width: tileView.frame.width - 130, height: 30))
            ageLabel.text = "Age: \(dog.age)"
            
            tileView.addSubview(imageView)
            tileView.addSubview(nameLabel)
            tileView.addSubview(ageLabel)
            scrollView.addSubview(tileView)
            
            tileY += 140
        }
        
        // Ustawienie rozmiaru przewijalnej zawartości
        scrollView.contentSize = CGSize(width: view.frame.width, height: tileY + 20)
        
        view.addSubview(scrollView)
    }
    
    private func fetchDogs() {
        
        
        // Dane piesków ode mnie
        
        let dog1 = Dog(name: "Burek", age: 2, image: UIImage(named: "dog1")!)
        let dog2 = Dog(name: "Reksio", age: 4, image: UIImage(named: "dog2")!)
        let dog3 = Dog(name: "Azor", age: 3, image: UIImage(named: "dog3")!)
        let dog4 = Dog(name: "Szarik", age: 5, image: UIImage(named: "dog4")!)
        let dog5 = Dog(name: "Puszek", age: 2, image: UIImage(named: "dog5")!)
        let dog6 = Dog(name: "Okruch", age: 1, image: UIImage(named: "dog6")!)
        let dog7 = Dog(name: "Benek", age: 6, image: UIImage(named: "dog7")!)
        let dog8 = Dog(name: "Fiona", age: 4, image: UIImage(named: "dog8")!)
        
      dogs = [dog1, dog2, dog3, dog4, dog5, dog6, dog7, dog8]
    }
}

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    private let durations = [20, 30, 45, 60, 90, 120]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        // Formularz ode mnie
        let datePicker = UIDatePicker(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 100))
        
          let durationPicker = UIPickerView(frame: CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 100))
        durationPicker.dataSource = self
        durationPicker.delegate = self
        
        let nameTextField = UITextField(frame: CGRect(x: 20, y: 340, width: view.frame.width - 40, height: 40))
        nameTextField.placeholder = "Imię"
        
        let surnameTextField = UITextField(frame: CGRect(x: 20, y: 400, width: view.frame.width - 40, height: 40))
        surnameTextField.placeholder = "Nazwisko"
        
        let phoneTextField = UITextField(frame: CGRect(x: 20, y: 460, width: view.frame.width - 40, height: 40))
        phoneTextField.placeholder = "Telefon"
        
        let emailTextField = UITextField(frame: CGRect(x: 20, y: 520, width: view.frame.width - 40, height: 40))
        emailTextField.placeholder = "Email"
        
        let submitButton = UIButton(frame: CGRect(x: 20, y: 580, width: view.frame.width - 40, height: 50))
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Dodanie elementów do widoku
        view.addSubview(datePicker)
        view.addSubview(durationPicker)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(phoneTextField)
        view.addSubview(emailTextField)
        view.addSubview(submitButton)
    }
    
    @objc private func submitButtonTapped() {
        // Walidacja wprowadzonych danych
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Wprowadź Imię.")
            return
        }
        
        guard let surname = surnameTextField.text, !surname.isEmpty else {
            showAlert(message: "Wprowadź Nazwisko.")
            return
        }
        
        guard let phone = phoneTextField.text, !phone.isEmpty else {
            showAlert(message: "Wsprowadź numer telefonu.")
            return
        }
        
        guard phone.count == 9 else {
            showAlert(message: "Numer telefonu musi składać się z 9 cyfr.")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(message: "Wprowadź adres email.")
            return
        }
        
        guard isValidEmail(email) else {
            showAlert(message: "Adres Email jest niepoprawny.")
            return
        }
        
        // Obsługa logiki przycisku Submit
        
        // Tworzenie obiektu ThirdViewController z danymi formularza
        let thirdViewController = ThirdViewController(name: name, surname: surname, phone: phone, email: email)
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
   private func showAlert(message: String) {
    let alertController = UIAlertController(title: "Błąd", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
}



class ThirdViewController: UIViewController {
    private let dogLabel: UILabel
    private let dateLabel: UILabel
    private let durationLabel: UILabel
    private let contactLabel: UILabel
    
    private let dog: Dog
    private let date: Date
    private let duration: Int
    
    init(dog: Dog, date: Date, duration: Int) {
        self.dogLabel = UILabel()
        self.dateLabel = UILabel()
        self.durationLabel = UILabel()
        self.contactLabel = UILabel()
        self.dog = dog
        self.date = date
        self.duration = duration
        
        super.init(nibName: nil, bundle: nil)
        
        self.dogLabel.text = "Wybrany piesek: \(dog.name)"
        self.dateLabel.text = "Data: \(formatDate(date))"
        self.durationLabel.text = "Czas spaceru: \(duration) minut"
        self.contactLabel.text = "Skontaktuj się ze schroniskiem jeżeli masz jakieś pytania. Napisz do nas na schronisko111@gmail.com"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Tworzenie etykiet
        dogLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 30)
        dogLabel.textAlignment = .center
        view.addSubview(dogLabel)
        
        dateLabel.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 30)
        dateLabel.textAlignment = .center
        view.addSubview(dateLabel)
        
        durationLabel.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 30)
        durationLabel.textAlignment = .center
        view.addSubview(durationLabel)
        
        contactLabel.frame = CGRect(x: 20, y: 250, width: view.frame.width - 40, height: 30)
        contactLabel.textAlignment = .center
        view.addSubview(contactLabel)
        
        // Tworzenie przycisku "Powrót"
        let backButton = UIButton(frame: CGRect(x: 20, y: 350, width: view.frame.width - 40, height: 50))
        backButton.setTitle("Powrót", for: .normal)
        backButton.backgroundColor = .systemBlue
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: date)
    }
}
