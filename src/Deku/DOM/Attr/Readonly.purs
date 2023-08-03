module Deku.DOM.Attr.Readonly where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Readonly = Readonly

instance Attr Input_ Readonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr Readonly bothValues = unsafeAttribute $ Both (pure 
    { key: "readonly", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "readonly", value: prop' value })
instance Attr Input_ Readonly (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Readonly (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "readonly", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "readonly", value: prop' value })
instance Attr Input_ Readonly  String  where
  attr Readonly value = unsafeAttribute $ This $ pure $
    { key: "readonly", value: prop' value }
instance Attr Input_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "readonly", value: prop' value }

instance Attr Input_ Readonly (ST.ST Global.Global  String ) where
  attr Readonly stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "readonly", value: prop' value }

instance Attr Textarea_ Readonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr Readonly bothValues = unsafeAttribute $ Both (pure 
    { key: "readonly", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "readonly", value: prop' value })
instance Attr Textarea_ Readonly (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Readonly (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "readonly", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "readonly", value: prop' value })
instance Attr Textarea_ Readonly  String  where
  attr Readonly value = unsafeAttribute $ This $ pure $
    { key: "readonly", value: prop' value }
instance Attr Textarea_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "readonly", value: prop' value }

instance Attr Textarea_ Readonly (ST.ST Global.Global  String ) where
  attr Readonly stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "readonly", value: prop' value }

instance Attr everything Readonly (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Readonly bothValues = unsafeAttribute $ Both (pure 
    { key: "readonly", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "readonly", value: unset' })
instance Attr everything Readonly (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Readonly (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "readonly", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "readonly", value: unset' })
instance Attr everything Readonly  Unit  where
  attr Readonly _ = unsafeAttribute $ This $ pure $
    { key: "readonly", value: unset' }
instance Attr everything Readonly (Event.Event  Unit ) where
  attr Readonly eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "readonly", value: unset' }

instance Attr everything Readonly (ST.ST Global.Global  Unit ) where
  attr Readonly stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "readonly", value: unset' }
