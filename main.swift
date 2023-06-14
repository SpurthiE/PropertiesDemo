//
//  main.swift
//  LazyStoredP
//
//  Created by spurthi.eshwarappa on 31/05/23.
//

import Foundation

/* A Lazy stored property is a property whose initial value is not calculated untill first time called,
 its a stored property but initializing is delayed, value is assigned only once

 its should always be a var keyword bcz initial value might not be retrieved untill instance initialization completes, constant let is must always have initial value before instance initialization completes
syntax - lazy var person: Person? = {
            return
        }()

 limitation - •    The use of lazy variables is restricted to structures and classes.
 •    You cannot declare a lazy constant (lazy let) because then its value could not change.
 •    A computed property cannot be a lazy variable. This is because a computed property is always recalculated when it is called.
 •    Initialization of a lazy variable is not an atomic operation. Thus, lazy variables are not thread-safe.

 when to use - A lazy var can be a great solution for code that’s expensive and unlikely to be called consistently.
 Sorting a collection of elements can be expensive so we want to make sure we’re only performing this operation if we’re actually using the value. Therefore, a lazy var is a great solution.
*/

struct Person {
    let name: String
    let age: Int
}

struct PeopleViewModel {
    var people: [Person]
    var num: Int = 2
    lazy var oldest: Person? = {
        print("Oldest is calculated")
        return people.max(by: { $0.age < $1.age})
    }()
    init(people: [Person]) {
        print("PeopleViewModel is initialized")
        self.people = people
    }
}

var vm = PeopleViewModel(people: [Person(name: "Xyz", age: 12), Person(name: "RYZ", age: 22), Person(name: "Xyz", age: 32)])
//print(vm.oldest!)
vm.people.append(Person(name: "RYT", age: 35))
print(vm.oldest!)
