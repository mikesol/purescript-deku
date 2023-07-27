module DOM.Reexport where

import Prelude
import Prim hiding (Type)

import Comment (commentDecl)
import DOM.Attr as Attr
import DOM.Common (Ctor(..), Element, TypeStub(..), attrModule, attrType, eltModule, eltType, exprHandler, handler, selfKey, typeArrayed, typeAttributed, typeEvented, typeImports, typeNut)
import DOM.Elt as Elt
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..))
import PureScript.CST.Types (ClassFundep(..), Declaration, Export, ImportDecl, Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (binderVar, binderWildcard, dataCtor, declClass, declData, declImport, declImportAs, declImportHiding, declInstance, declSignature, declValue, exportClass, exportModule, exportTypeAll, exportValue, exprApp, exprIdent, importOp, importType, importTypeAll, importValue, instValue, typeApp, typeArrow, typeCtor, typeForall, typeString, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

exports :: Partial => Array Element -> Array Ctor -> Array ( Export Void )
exports elts attrs =
    map ( exportModule <<< eltModule <<< _.ctor ) elts
        <> map ( exportModule <<< attrModule ) attrs
        <>
        [ exportTypeAll "Self"
        , exportTypeAll "SelfT"
        , exportClass "TagToDeku"
        , exportValue "unsafeCustomElement"
        ]

imports :: Partial => Array Element -> Array Ctor -> Array String -> Array ( ImportDecl Void )
imports elts attrs dom =
    map eltImport elts
        <> map attrImport attrs
        <> typeImports [ TypeSelfHandler ]
        <> flip map dom (\ e -> declImportAs ( "Web.HTML." <> e ) [ importType e ] "Web" )
        <>
            [ declImportAs ( "Web.DOM.Element" ) [ importType "Element" ] "Web"
            , declImport "Type.Proxy" [ importType "Proxy" ]
            , declImportAs "Deku.Control" [] "DC"
            , declImportAs "FRP.Event" [] "FRP.Event"
            , declImport "Deku.Core" [ importType "Nut" ]
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportHiding "Prim" [ importType "Type", importType "Char" ]
            ]

    where

    eltImport :: Partial => Element -> ImportDecl Void
    eltImport { ctor } = do
        let { typeMarker, name, short, shortest } = Elt.names ctor    
        declImport ( eltModule ctor )
            [ importType typeMarker
            , importValue name
            , importValue short
            , importValue shortest
            ]

    attrImport :: Partial => Ctor -> ImportDecl Void
    attrImport ctor = do
        let typeMarker = attrType ctor
        declImport ( attrModule ctor ) [ importTypeAll typeMarker ]

generate :: Partial => Array Element -> Array String -> Array ( Declaration Void )
generate elts dom =
    [ commentDecl
        [ "Creates a special event where an Deku element can have its raw DOM element"
        , "injected into a closure. All bets are off type-safety wise. This is useful"
        , "when you need to manipualte the element itself, like for example attaching"
        , "properties to it, etc."
        ] 
        $ declData "Self" [] [ dataCtor "Self" [] ]

    , declInstance Nothing [] Attr.typeAttr [ typeAnything, typeSelf, selfHandler $ typeCtor "Web.Element" ]
        [ instValue "attr" [ binderWildcard ]
            $ exprHandler selfKey $ handler TypeSelfHandler
        ]

    , commentDecl
        [ "A slightly less permissive version of `Self` that associates Deku Elements to"
        , "the primitive element definitions form `purescript-web`. For example, `A_` from `deku`"
        , "gets translated to `HTMLAnchorElement` from `purescript-web`, etc."
        ] 
        $ declData "SelfT" [] [ dataCtor "SelfT" [] ]

    , commentDecl 
        [ "Unsafely create a custom element. This is useful when using Stencil-based"
        , "frameworks like Ionic in Deku."
        ]
        $ declSignature "unsafeCustomElement"
        $ typeForall [ typeVar "element" ]
        $ typeArrow
            [ typeCtor "String"
            , typeApp ( typeCtor "Proxy" ) [ typeElement ]
            , typeArrayed $ typeEvented $ typeAttributed typeElement
            , typeArrayed typeNut
            ]
            typeNut

    , declValue "unsafeCustomElement" [ binderVar "name", binderWildcard ]
        $ exprApp ( exprIdent "DC.elementify2" ) [ exprIdent "name" ]
    
    , declClass [] "TagToDeku"
        [ typeVarKinded "tag" ( typeCtor "Symbol" )
        , typeVarKinded "deku" ( typeCtor "Prim.Type" )
        ]
        [ FundepDetermines ( NEA.singleton ( toName "tag") ) tokRightArrow ( NEA.singleton ( toName "deku" ) )
        ]
        []
    ]
    <> bind elts 
        ( \elt ->
            [ declInstance Nothing [] "TagToDeku"
                [ typeString elt.tag, typeCtor $ eltType elt.ctor ]
                []
            ]
        )
    <> bind elts \elt ->
        if coerce elt.interface `Array.elem` dom then 
            [ declInstance Nothing [] Attr.typeAttr
                [ typeCtor $ eltType elt.ctor, typeSelfT, selfHandler $ typeCtor $ "Web." <> coerce elt.interface ]
                [ instValue "attr" [ binderWildcard ] $ exprHandler selfKey $ handler TypeSelfHandler
                ]
            ]
        else
            []

selfHandler :: Partial => Type Void -> Type Void
selfHandler domType =
    typeArrow [ domType ] $ typeApp ( typeCtor "Effect.Effect" ) [ Attr.typeUnit ]

typeAnything :: Partial => Type Void
typeAnything =
    typeVar "anything"

typeElement :: Partial => Type Void
typeElement =
    typeVar "element"

typeSelf :: Partial => Type Void
typeSelf =
    typeCtor "Self"

typeSelfT :: Partial => Type Void
typeSelfT =
    typeCtor "SelfT"