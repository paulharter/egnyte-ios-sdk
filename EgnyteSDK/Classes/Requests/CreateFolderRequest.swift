//
//  CreateFolderRequest.swift
//  EgnyteSDK
//
//  Created by Adam Kędzia on 07.11.2016.
//  Copyright © 2017 Egnyte. All rights reserved.
//

import Foundation

/// Request for creating new folder.
@objc public class CreateFolderRequest: EgnyteBaseRequest {
    
   /// Initialize CreateFolderRequest
   ///
   /// - Parameters:
   ///   - apiClient: EgnyteAPIClient which performs and authorize request.
   ///   - path: Path containig new folder.
   ///   - completion: Completion with closure returning Boolean value or thorwing EgnyteError.
   public init(apiClient: EgnyteAPIClient,
               path: String,
               completion:@escaping (@escaping () throws -> Bool) -> Void) {
        try! super.init(apiClient: apiClient,
                        endpoint: "pubapi/v1/fs",
                        filepath: path,
                        method: "POST",
                        parameters: ["action": "add_folder"],
                        errorHandler: nil) { result in
                            
                            do{
                                _ = try result()
                                completion({return true})
                            }catch let error {
                                completion({throw error})
                            }
        }
    }
}
