//
//  BooksListModels.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.


import UIKit
import ObjectMapper

enum BooksList
{
    struct Response:Mappable
    {
        var kind : String?
        var totalItems : Int?
        var items : [Items]?

        init?(map: Map) {

        }

        mutating func mapping(map: Map) {

            kind <- map["kind"]
            totalItems <- map["totalItems"]
            items <- map["items"]
        }
    }
    
    struct ViewModel
    {
        var BookList:[BooksDetail]?
    }
    
    struct BooksDetail {
        var bookTitle:String?
        var bookDescription:String?
        var bookImageUrl:String?
    }
}



struct Items : Mappable {
    var kind : String?
    var id : String?
    var etag : String?
    var selfLink : String?
    var volumeInfo : VolumeInfo?
    var country : String?
    var saleability : String?
    var isEbook : Bool?
    var accessInfo : AccessInfo?
    var textSnippet : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
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

struct IndustryIdentifiers : Mappable {
    var type : String?
    var identifier : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        type <- map["type"]
        identifier <- map["identifier"]
    }

}



struct VolumeInfo : Mappable {
    var title : String?
    var subtitle : String?
    var authors : [String]?
    var publisher : String?
    var publishedDate : String?
    var industryIdentifiers : [IndustryIdentifiers]?
    var pageCount : Int?
    var printType : String?
    var averageRating : Double?
    var ratingsCount : Int?
    var maturityRating : String?
    var allowAnonLogging : Bool?
    var contentVersion : String?
    var panelizationSummary : PanelizationSummary?
    var imageLinks : ImageLinks?
    var language : String?
    var previewLink : String?
    var infoLink : String?
    var canonicalVolumeLink : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        title <- map["title"]
        subtitle <- map["subtitle"]
        authors <- map["authors"]
        publisher <- map["publisher"]
        publishedDate <- map["publishedDate"]
        industryIdentifiers <- map["industryIdentifiers"]
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


struct Pdf : Mappable {
    var isAvailable : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        isAvailable <- map["isAvailable"]
    }

}


struct PanelizationSummary : Mappable {
    var containsEpubBubbles : Bool?
    var containsImageBubbles : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        containsEpubBubbles <- map["containsEpubBubbles"]
        containsImageBubbles <- map["containsImageBubbles"]
    }

}




struct AccessInfo : Mappable {
    var country : String?
    var viewability : String?
    var embeddable : Bool?
    var publicDomain : Bool?
    var textToSpeechPermission : String?
    var epub : Epub?
    var pdf : Pdf?
    var webReaderLink : String?
    var accessViewStatus : String?
    var quoteSharingAllowed : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

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


struct ImageLinks : Mappable {
    var smallThumbnail : String?
    var thumbnail : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        smallThumbnail <- map["smallThumbnail"]
        thumbnail <- map["thumbnail"]
    }

}



struct Epub : Mappable {
    var isAvailable : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        isAvailable <- map["isAvailable"]
    }

}

