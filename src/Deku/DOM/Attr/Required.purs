module Deku.DOM.Attr.Required where

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
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Required = Required

instance Attr Input_ Required (NonEmpty.NonEmpty Event.Event  String ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Input_ Required (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Required (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "required", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Input_ Required  String  where
  attr Required value = unsafeAttribute $ This $ pure $
    { key: "required", value: prop' value }
instance Attr Input_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Input_ Required (ST.ST Global.Global  String ) where
  attr Required stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Select_ Required (NonEmpty.NonEmpty Event.Event  String ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Select_ Required (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Required (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "required", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Select_ Required  String  where
  attr Required value = unsafeAttribute $ This $ pure $
    { key: "required", value: prop' value }
instance Attr Select_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Select_ Required (ST.ST Global.Global  String ) where
  attr Required stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Textarea_ Required (NonEmpty.NonEmpty Event.Event  String ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Textarea_ Required (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Required (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "required", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Textarea_ Required  String  where
  attr Required value = unsafeAttribute $ This $ pure $
    { key: "required", value: prop' value }
instance Attr Textarea_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Textarea_ Required (ST.ST Global.Global  String ) where
  attr Required stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr everything Required (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "required", value: unset' })
instance Attr everything Required (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Required (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "required", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "required", value: unset' })
instance Attr everything Required  Unit  where
  attr Required _ = unsafeAttribute $ This $ pure $
    { key: "required", value: unset' }
instance Attr everything Required (Event.Event  Unit ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "required", value: unset' }

instance Attr everything Required (ST.ST Global.Global  Unit ) where
  attr Required stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "required", value: unset' }
