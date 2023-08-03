module Deku.DOM.Attr.RepeatDur where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RepeatDur = RepeatDur

instance Attr Animate_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr Animate_ RepeatDur (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RepeatDur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "repeatDur", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr Animate_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This $ pure $
    { key: "repeatDur", value: prop' value }
instance Attr Animate_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr Animate_ RepeatDur (ST.ST Global.Global  String ) where
  attr RepeatDur stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr AnimateMotion_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr AnimateMotion_ RepeatDur (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RepeatDur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "repeatDur", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr AnimateMotion_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This $ pure $
    { key: "repeatDur", value: prop' value }
instance Attr AnimateMotion_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr AnimateMotion_ RepeatDur (ST.ST Global.Global  String ) where
  attr RepeatDur stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr AnimateTransform_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr AnimateTransform_ RepeatDur (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RepeatDur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "repeatDur", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr AnimateTransform_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This $ pure $
    { key: "repeatDur", value: prop' value }
instance Attr AnimateTransform_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr AnimateTransform_ RepeatDur (ST.ST Global.Global  String ) where
  attr RepeatDur stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr Set_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr Set_ RepeatDur (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RepeatDur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "repeatDur", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr Set_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This $ pure $
    { key: "repeatDur", value: prop' value }
instance Attr Set_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr Set_ RepeatDur (ST.ST Global.Global  String ) where
  attr RepeatDur stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr everything RepeatDur (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatDur", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "repeatDur", value: unset' })
instance Attr everything RepeatDur (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr RepeatDur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "repeatDur", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "repeatDur", value: unset' })
instance Attr everything RepeatDur  Unit  where
  attr RepeatDur _ = unsafeAttribute $ This $ pure $
    { key: "repeatDur", value: unset' }
instance Attr everything RepeatDur (Event.Event  Unit ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "repeatDur", value: unset' }

instance Attr everything RepeatDur (ST.ST Global.Global  Unit ) where
  attr RepeatDur stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "repeatDur", value: unset' }
