module Deku.DOM.Attr.By where

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

data By = By

instance Attr Animate_ By (NonEmpty.NonEmpty Event.Event  String ) where
  attr By bothValues = unsafeAttribute $ Both (pure 
    { key: "by", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr Animate_ By (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr By (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "by", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr Animate_ By  String  where
  attr By value = unsafeAttribute $ This $ pure $ { key: "by", value: prop' value }
instance Attr Animate_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr Animate_ By (ST.ST Global.Global  String ) where
  attr By stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateMotion_ By (NonEmpty.NonEmpty Event.Event  String ) where
  attr By bothValues = unsafeAttribute $ Both (pure 
    { key: "by", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr AnimateMotion_ By (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr By (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "by", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr AnimateMotion_ By  String  where
  attr By value = unsafeAttribute $ This $ pure $ { key: "by", value: prop' value }
instance Attr AnimateMotion_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateMotion_ By (ST.ST Global.Global  String ) where
  attr By stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateTransform_ By (NonEmpty.NonEmpty Event.Event  String ) where
  attr By bothValues = unsafeAttribute $ Both (pure 
    { key: "by", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr AnimateTransform_ By (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr By (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "by", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr AnimateTransform_ By  String  where
  attr By value = unsafeAttribute $ This $ pure $ { key: "by", value: prop' value }
instance Attr AnimateTransform_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateTransform_ By (ST.ST Global.Global  String ) where
  attr By stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr everything By (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr By bothValues = unsafeAttribute $ Both (pure  { key: "by", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "by", value: unset' })
instance Attr everything By (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr By (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "by", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "by", value: unset' })
instance Attr everything By  Unit  where
  attr By _ = unsafeAttribute $ This $ pure $ { key: "by", value: unset' }
instance Attr everything By (Event.Event  Unit ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "by", value: unset' }

instance Attr everything By (ST.ST Global.Global  Unit ) where
  attr By stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "by", value: unset' }
