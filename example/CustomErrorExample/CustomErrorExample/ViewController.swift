//
//  ViewController.swift
//  CustomErrorExample
//
//  Created by wade on 2023/01/16.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let customError1 = CustomError()    // empty parameter -> UnknownError
        let customError2 = CustomError(domain: "CustomErrorExample", code: -1)  // Is the same as NSError.
        let customError3 = CustomError(domain: "CustomErrorExample", code: -1, userInfo: [NSLocalizedDescriptionKey : "custom error"]) // Is the same as NSError.
        
        print("\(customError1)")
        print("\(customError2)")
        print("\(customError3)")
        
        let sampleError1 = SampleError(type: SampleErrorType.sample1)
        let sampleError2 = SampleErrorType.sample2.error
        let sampleErrorWithAdditionalWording = SampleErrorType.sample1.error("addtional wording")
        
        print("\(sampleError1)")
        print("\(sampleError2)")
        print("\(sampleErrorWithAdditionalWording)")
        
        let errorType = SampleErrorType.sample1
        
        if errorType == SampleErrorType.sample1 {
            print("same")
        }else {
            print("not same")
        }
        
//        Binary operator '==' cannot be applied to operands of type 'Int' and 'SampleErrorType'
//        if sampleError1.code == SampleErrorType.sample1 {
//
//        }
        
        
        let errorType2 = SampleEquatableErrorType.sampleEquatable1
        
        if errorType2 == 20000 {
            print("same")
        }else {
            print("not same")
        }
        
        if sampleError1.type == errorType2 {
            print("same")
        }else {
            print("not same")
        }
        
        let badRequestError = HttpClientErrorType.badRequest
        let unauthorizedError = HttpClientErrorType.unauthorized.error
        let paymentRequiredError = HttpClientErrorType.paymentRequired.error("Reserved for future use.")
        let forbiddenErrorType = HttpClientErrorType.forbidden
        let forbiddenError: Error = forbiddenErrorType
        
        print("\(badRequestError) (\(badRequestError.code))")
        print("\(unauthorizedError)")
        print("\(paymentRequiredError)")
        print("\(forbiddenErrorType) (\(forbiddenErrorType.code))")
//        print("\(forbiddenError) (\(forbiddenError.code))") // Value of type 'any Error' has no member 'code'
        print("\(forbiddenError.localizedDescription)")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

