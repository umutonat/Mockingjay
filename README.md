# Mockingjay

![SPM](https://github.com/umutonat/Loadable/actions/workflows/swift.yml/badge.svg)

Mockingjay simplifies creating mock objects in Swift.


## Usage

Calling Mockingjay().mock() creates a new object of given type.

``` swift
struct Cat: Codable, Equatable {
let age: Int
let name: String
let speed: Double
let children: [CatChild]
let parent: CatParent

enum CatChild: String, Codable {
case one
case two
case three
}
}

struct CatParent: Codable, Equatable {
let parentId: String
}

let mock: Cat? = try Mockingjay().mock()
´´´
