module Deku.DOM.Attr.End where

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

data End = End

instance Attr Animate_ End (NonEmpty.NonEmpty Event.Event  String ) where
  attr End bothValues = unsafeAttribute $ Both (pure 
    { key: "end", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr Animate_ End (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr End (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "end", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr Animate_ End  String  where
  attr End value = unsafeAttribute $ This $ { key: "end", value: prop' value }
instance Attr Animate_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr Animate_ End (ST.ST Global.Global  String ) where
  attr End iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "end", value: prop' value }

instance Attr AnimateMotion_ End (NonEmpty.NonEmpty Event.Event  String ) where
  attr End bothValues = unsafeAttribute $ Both (pure 
    { key: "end", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr AnimateMotion_ End (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr End (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "end", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr AnimateMotion_ End  String  where
  attr End value = unsafeAttribute $ This $ { key: "end", value: prop' value }
instance Attr AnimateMotion_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr AnimateMotion_ End (ST.ST Global.Global  String ) where
  attr End iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "end", value: prop' value }

instance Attr AnimateTransform_ End (NonEmpty.NonEmpty Event.Event  String ) where
  attr End bothValues = unsafeAttribute $ Both (pure 
    { key: "end", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr AnimateTransform_ End (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr End (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "end", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr AnimateTransform_ End  String  where
  attr End value = unsafeAttribute $ This $ { key: "end", value: prop' value }
instance Attr AnimateTransform_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr AnimateTransform_ End (ST.ST Global.Global  String ) where
  attr End iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "end", value: prop' value }

instance Attr Set_ End (NonEmpty.NonEmpty Event.Event  String ) where
  attr End bothValues = unsafeAttribute $ Both (pure 
    { key: "end", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr Set_ End (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr End (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "end", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "end", value: prop' value })
instance Attr Set_ End  String  where
  attr End value = unsafeAttribute $ This $ { key: "end", value: prop' value }
instance Attr Set_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr Set_ End (ST.ST Global.Global  String ) where
  attr End iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "end", value: prop' value }

instance Attr everything End (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr End bothValues = unsafeAttribute $ Both (pure  { key: "end", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "end", value: unset' })
instance Attr everything End (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr End (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "end", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "end", value: unset' })
instance Attr everything End  Unit  where
  attr End _ = unsafeAttribute $ This $ { key: "end", value: unset' }
instance Attr everything End (Event.Event  Unit ) where
  attr End eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "end", value: unset' }

instance Attr everything End (ST.ST Global.Global  Unit ) where
  attr End iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "end", value: unset' }
