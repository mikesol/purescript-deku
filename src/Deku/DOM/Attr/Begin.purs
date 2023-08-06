module Deku.DOM.Attr.Begin where

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

data Begin = Begin

instance Attr Animate_ Begin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Begin bothValues = unsafeAttribute $ Both (pure 
    { key: "begin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr Animate_ Begin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Begin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "begin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr Animate_ Begin  String  where
  attr Begin value = unsafeAttribute $ This $ pure $
    { key: "begin", value: prop' value }
instance Attr Animate_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr Animate_ Begin (ST.ST Global.Global  String ) where
  attr Begin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "begin", value: prop' value }

instance Attr AnimateMotion_ Begin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Begin bothValues = unsafeAttribute $ Both (pure 
    { key: "begin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr AnimateMotion_ Begin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Begin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "begin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr AnimateMotion_ Begin  String  where
  attr Begin value = unsafeAttribute $ This $ pure $
    { key: "begin", value: prop' value }
instance Attr AnimateMotion_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr AnimateMotion_ Begin (ST.ST Global.Global  String ) where
  attr Begin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "begin", value: prop' value }

instance Attr AnimateTransform_ Begin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Begin bothValues = unsafeAttribute $ Both (pure 
    { key: "begin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr AnimateTransform_ Begin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Begin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "begin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr AnimateTransform_ Begin  String  where
  attr Begin value = unsafeAttribute $ This $ pure $
    { key: "begin", value: prop' value }
instance Attr AnimateTransform_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr AnimateTransform_ Begin (ST.ST Global.Global  String ) where
  attr Begin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "begin", value: prop' value }

instance Attr Set_ Begin (NonEmpty.NonEmpty Event.Event  String ) where
  attr Begin bothValues = unsafeAttribute $ Both (pure 
    { key: "begin", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr Set_ Begin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Begin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "begin", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "begin", value: prop' value })
instance Attr Set_ Begin  String  where
  attr Begin value = unsafeAttribute $ This $ pure $
    { key: "begin", value: prop' value }
instance Attr Set_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr Set_ Begin (ST.ST Global.Global  String ) where
  attr Begin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "begin", value: prop' value }

instance Attr everything Begin (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Begin bothValues = unsafeAttribute $ Both (pure  { key: "begin", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "begin", value: unset' })
instance Attr everything Begin (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Begin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "begin", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "begin", value: unset' })
instance Attr everything Begin  Unit  where
  attr Begin _ = unsafeAttribute $ This $ { key: "begin", value: unset' }
instance Attr everything Begin (Event.Event  Unit ) where
  attr Begin eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "begin", value: unset' }

instance Attr everything Begin (ST.ST Global.Global  Unit ) where
  attr Begin iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "begin", value: unset' }
