module Deku.DOM.Attr.From where

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

data From = From

instance Attr Animate_ From (NonEmpty.NonEmpty Event.Event  String ) where
  attr From bothValues = unsafeAttribute $ Both (pure 
    { key: "from", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr Animate_ From (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr From (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "from", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr Animate_ From  String  where
  attr From value = unsafeAttribute $ This $ pure $
    { key: "from", value: prop' value }
instance Attr Animate_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr Animate_ From (ST.ST Global.Global  String ) where
  attr From stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr AnimateMotion_ From (NonEmpty.NonEmpty Event.Event  String ) where
  attr From bothValues = unsafeAttribute $ Both (pure 
    { key: "from", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr AnimateMotion_ From (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr From (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "from", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr AnimateMotion_ From  String  where
  attr From value = unsafeAttribute $ This $ pure $
    { key: "from", value: prop' value }
instance Attr AnimateMotion_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr AnimateMotion_ From (ST.ST Global.Global  String ) where
  attr From stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr AnimateTransform_ From (NonEmpty.NonEmpty Event.Event  String ) where
  attr From bothValues = unsafeAttribute $ Both (pure 
    { key: "from", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr AnimateTransform_ From (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr From (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "from", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr AnimateTransform_ From  String  where
  attr From value = unsafeAttribute $ This $ pure $
    { key: "from", value: prop' value }
instance Attr AnimateTransform_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr AnimateTransform_ From (ST.ST Global.Global  String ) where
  attr From stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr everything From (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr From bothValues = unsafeAttribute $ Both (pure  { key: "from", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "from", value: unset' })
instance Attr everything From (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr From (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "from", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "from", value: unset' })
instance Attr everything From  Unit  where
  attr From _ = unsafeAttribute $ This $ pure $ { key: "from", value: unset' }
instance Attr everything From (Event.Event  Unit ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "from", value: unset' }

instance Attr everything From (ST.ST Global.Global  Unit ) where
  attr From stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "from", value: unset' }
