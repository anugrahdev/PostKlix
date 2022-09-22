//
//  Module.swift
//  PostKlix
//
//  Created by Anang Nugraha on 20/09/22.
//

import Foundation

class Module {
    static var bundle = Bundle(for: Module.self)
    static var container: Container!
}

public class Base: NSObject {
    var container: Container!
    
    public override init() {
        super.init()
        setup()
    }
    
    func setup() {
    }
}

public class PostKlix: Base {
    override func setup() {
        if container == nil {
            container = Container()
            .register(Bundle.self, instance: Bundle.main)
            .register(Router.self) { (resolver) -> Router in
                return Router(resolver: resolver)
            }
        }
        Module.container = container
    }
}
