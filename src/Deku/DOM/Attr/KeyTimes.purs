module Deku.DOM.Attr.KeyTimes where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyTimes = KeyTimes

instance Attr Animate_ KeyTimes (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both (pure 
    { key: "keyTimes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr Animate_ KeyTimes (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeyTimes (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyTimes", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr Animate_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: prop' value }
instance Attr Animate_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr Animate_ KeyTimes (ST.ST Global.Global  String ) where
  attr KeyTimes stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr AnimateMotion_ KeyTimes (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both (pure 
    { key: "keyTimes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr AnimateMotion_ KeyTimes (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeyTimes (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyTimes", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr AnimateMotion_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: prop' value }
instance Attr AnimateMotion_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr AnimateMotion_ KeyTimes (ST.ST Global.Global  String ) where
  attr KeyTimes stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr AnimateTransform_ KeyTimes (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both (pure 
    { key: "keyTimes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr AnimateTransform_ KeyTimes (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeyTimes (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keyTimes", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr AnimateTransform_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: prop' value }
instance Attr AnimateTransform_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr AnimateTransform_ KeyTimes (ST.ST Global.Global  String ) where
  attr KeyTimes stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr everything KeyTimes (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both (pure 
    { key: "keyTimes", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyTimes", value: unset' })
instance Attr everything KeyTimes (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr KeyTimes (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "keyTimes", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keyTimes", value: unset' })
instance Attr everything KeyTimes  Unit  where
  attr KeyTimes _ = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: unset' }
instance Attr everything KeyTimes (Event.Event  Unit ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "keyTimes", value: unset' }

instance Attr everything KeyTimes (ST.ST Global.Global  Unit ) where
  attr KeyTimes stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "keyTimes", value: unset' }
