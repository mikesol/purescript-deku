module Deku.DOM.Attr.Size where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Size = Size

instance Attr Input_ Size (NonEmpty.NonEmpty Event.Event  String ) where
  attr Size bothValues = unsafeAttribute $ Both (pure 
    { key: "size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "size", value: prop' value })
instance Attr Input_ Size (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Size (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "size", value: prop' value })
instance Attr Input_ Size  String  where
  attr Size value = unsafeAttribute $ This $ pure $
    { key: "size", value: prop' value }
instance Attr Input_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "size", value: prop' value }

instance Attr Input_ Size (ST.ST Global.Global  String ) where
  attr Size stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "size", value: prop' value }

instance Attr Select_ Size (NonEmpty.NonEmpty Event.Event  String ) where
  attr Size bothValues = unsafeAttribute $ Both (pure 
    { key: "size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "size", value: prop' value })
instance Attr Select_ Size (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Size (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "size", value: prop' value })
instance Attr Select_ Size  String  where
  attr Size value = unsafeAttribute $ This $ pure $
    { key: "size", value: prop' value }
instance Attr Select_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "size", value: prop' value }

instance Attr Select_ Size (ST.ST Global.Global  String ) where
  attr Size stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "size", value: prop' value }

instance Attr everything Size (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Size bothValues = unsafeAttribute $ Both (pure  { key: "size", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "size", value: unset' })
instance Attr everything Size (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Size (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "size", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "size", value: unset' })
instance Attr everything Size  Unit  where
  attr Size _ = unsafeAttribute $ This $ pure $ { key: "size", value: unset' }
instance Attr everything Size (Event.Event  Unit ) where
  attr Size eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "size", value: unset' }

instance Attr everything Size (ST.ST Global.Global  Unit ) where
  attr Size stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "size", value: unset' }
