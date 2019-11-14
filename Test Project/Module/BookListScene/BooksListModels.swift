//
//  BooksListModels.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.


import UIKit
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

enum BooksList
{
    struct ViewModel
    {
        var BookList:[BooksDetail]?
    }
    
    struct BooksDetail {
        var bookTitle:String = ""
        var bookDescription:String = ""
        var bookImageUrl:String = ""
    }
}


//MARK: Response Model
class  BookResponse:Object,Mappable
{
    @objc dynamic var kind : String = ""
    @objc dynamic var totalItems : Int = 0
    var items = List<Items>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String {
        return "kind"
    }
    
    func mapping(map: Map) {
        
        kind <- map["kind"]
        totalItems <- map["totalItems"]
        items <- (map["items"], ListTransform<Items>())
    }
}

//MARK: Items Model

class Items:Object,Mappable {
    @objc dynamic var kind : String = ""
    @objc dynamic var id : String = ""
    @objc dynamic var etag : String = ""
    @objc dynamic var selfLink : String = ""
    @objc dynamic var volumeInfo : VolumeInfo?
    @objc dynamic var country : String = ""
    @objc dynamic var saleability : String = ""
    @objc dynamic var isEbook : Bool = false
    @objc dynamic var accessInfo : AccessInfo?
    @objc dynamic var textSnippet : String = ""

    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
    
     func mapping(map: Map) {
        kind <- map["kind"]
        id <- map["id"]
        etag <- map["etag"]
        selfLink <- map["selfLink"]
        volumeInfo <- map["volumeInfo"]
        country <- map["saleInfo.country"]
        saleability <- map["saleInfo.saleability"]
        isEbook <- map["saleInfo.isEbook"]
        accessInfo <- map["accessInfo"]
        textSnippet <- map["searchInfo.textSnippet"]
    }
}




class VolumeInfo:Object,Mappable {
    @objc dynamic var title : String = ""
    @objc dynamic var subtitle : String = ""
    var authors : Array<String> = Array<String>()
    @objc dynamic var publisher : String = ""
    @objc dynamic var publishedDate : String = ""
    var industryIdentifiers  = List<IndustryIdentifiers>()
    @objc dynamic var pageCount : Int = 0
    @objc dynamic var printType : String = ""
    @objc dynamic var averageRating : Double = 0.0
    @objc dynamic var ratingsCount : Int = 0
    @objc dynamic var maturityRating : String = ""
    @objc dynamic var allowAnonLogging : Bool = false
    @objc dynamic var contentVersion : String = ""
    @objc dynamic var panelizationSummary : PanelizationSummary?
    @objc dynamic var imageLinks : ImageLinks?
    @objc dynamic var language : String = ""
    @objc dynamic var previewLink : String = ""
    @objc dynamic var infoLink : String = ""
    @objc dynamic var canonicalVolumeLink : String = ""

    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String {
        return "title"
    }

     func mapping(map: Map) {

        title <- map["title"]
        subtitle <- map["subtitle"]
        authors <- map["authors"]
        publisher <- map["publisher"]
        publishedDate <- map["publishedDate"]
        industryIdentifiers <- (map["industryIdentifiers"], ListTransform<IndustryIdentifiers>())
        pageCount <- map["pageCount"]
        printType <- map["printType"]
        averageRating <- map["averageRating"]
        ratingsCount <- map["ratingsCount"]
        maturityRating <- map["maturityRating"]
        allowAnonLogging <- map["allowAnonLogging"]
        contentVersion <- map["contentVersion"]
        panelizationSummary <- map["panelizationSummary"]
        imageLinks <- map["imageLinks"]
        language <- map["language"]
        previewLink <- map["previewLink"]
        infoLink <- map["infoLink"]
        canonicalVolumeLink <- map["canonicalVolumeLink"]
    }

}


class IndustryIdentifiers:Object,Mappable {
    @objc dynamic var type : String = ""
    @objc dynamic var identifier : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
   
    
    func mapping(map: Map) {
        
        type <- map["type"]
        identifier <- map["identifier"]
    }
    
}


class Pdf:Object,Mappable {
    @objc dynamic var isAvailable : Bool = false

    required convenience init?(map: Map) {
        self.init()
    }

   
    
     func mapping(map: Map) {

        isAvailable <- map["isAvailable"]
    }

}


class PanelizationSummary:Object,Mappable {
    @objc dynamic var containsEpubBubbles : Bool = false
    @objc dynamic var containsImageBubbles : Bool = false

    required convenience init?(map: Map) {
        self.init()
    }    
    
     func mapping(map: Map) {

        containsEpubBubbles <- map["containsEpubBubbles"]
        containsImageBubbles <- map["containsImageBubbles"]
    }

}

class AccessInfo:Object,Mappable {
    @objc dynamic var country : String = ""
    @objc dynamic var viewability : String = ""
    @objc dynamic var embeddable : Bool = false
    @objc dynamic var publicDomain : Bool = false
    @objc dynamic var textToSpeechPermission : String = ""
    @objc dynamic var epub : Epub?
    @objc dynamic var pdf : Pdf?
    @objc dynamic var webReaderLink : String = ""
    @objc dynamic var accessViewStatus : String = ""
    @objc dynamic var quoteSharingAllowed : Bool = false

    required convenience init?(map: Map) {
        self.init()
    }
    
    

     func mapping(map: Map) {

        country <- map["country"]
        viewability <- map["viewability"]
        embeddable <- map["embeddable"]
        publicDomain <- map["publicDomain"]
        textToSpeechPermission <- map["textToSpeechPermission"]
        epub <- map["epub"]
        pdf <- map["pdf"]
        webReaderLink <- map["webReaderLink"]
        accessViewStatus <- map["accessViewStatus"]
        quoteSharingAllowed <- map["quoteSharingAllowed"]
    }

}


class ImageLinks:Object,Mappable {
    @objc dynamic var smallThumbnail : String = ""
    @objc dynamic var thumbnail : String = ""

    required convenience init?(map: Map) {
        self.init()
    }
   
     func mapping(map: Map) {

        smallThumbnail <- map["smallThumbnail"]
        thumbnail <- map["thumbnail"]
    }

}



class Epub:Object,Mappable {
    @objc dynamic var isAvailable : Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {

        isAvailable <- map["isAvailable"]
    }

}




class ListTransform<T:RealmSwift.Object> : TransformType where T:Mappable {
    typealias Object = List<T>
    typealias JSON = [AnyObject]
    
    let mapper = Mapper<T>()
    
    func transformFromJSON(_ value: Any?) -> Object? {
        let results = List<T>()
        if let objects = mapper.mapArray(JSONObject: value) {
            for object in objects {
                results.append(object)
            }
        }
        return results
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        var results = [AnyObject]()
        if let value = value {
            for obj in value {
                let json = mapper.toJSON(obj)
                results.append(json as AnyObject)
            }
        }
        return results
    }
}
