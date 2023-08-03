module Deku.DOM.Attr.Restart where

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

data Restart = Restart

instance Attr Animate_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both (pure 
    { key: "restart", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr Animate_ Restart (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Restart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "restart", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr Animate_ Restart  String  where
  attr Restart value = unsafeAttribute $ This $ pure $
    { key: "restart", value: prop' value }
instance Attr Animate_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr Animate_ Restart (ST.ST Global.Global  String ) where
  attr Restart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr AnimateMotion_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both (pure 
    { key: "restart", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr AnimateMotion_ Restart (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Restart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "restart", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr AnimateMotion_ Restart  String  where
  attr Restart value = unsafeAttribute $ This $ pure $
    { key: "restart", value: prop' value }
instance Attr AnimateMotion_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr AnimateMotion_ Restart (ST.ST Global.Global  String ) where
  attr Restart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr AnimateTransform_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both (pure 
    { key: "restart", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr AnimateTransform_ Restart (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Restart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "restart", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr AnimateTransform_ Restart  String  where
  attr Restart value = unsafeAttribute $ This $ pure $
    { key: "restart", value: prop' value }
instance Attr AnimateTransform_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr AnimateTransform_ Restart (ST.ST Global.Global  String ) where
  attr Restart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr Set_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both (pure 
    { key: "restart", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr Set_ Restart (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Restart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "restart", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr Set_ Restart  String  where
  attr Restart value = unsafeAttribute $ This $ pure $
    { key: "restart", value: prop' value }
instance Attr Set_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr Set_ Restart (ST.ST Global.Global  String ) where
  attr Restart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr everything Restart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Restart bothValues = unsafeAttribute $ Both (pure 
    { key: "restart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "restart", value: unset' })
instance Attr everything Restart (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Restart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "restart", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "restart", value: unset' })
instance Attr everything Restart  Unit  where
  attr Restart _ = unsafeAttribute $ This $ pure $ { key: "restart", value: unset' }
instance Attr everything Restart (Event.Event  Unit ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "restart", value: unset' }

instance Attr everything Restart (ST.ST Global.Global  Unit ) where
  attr Restart stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "restart", value: unset' }
