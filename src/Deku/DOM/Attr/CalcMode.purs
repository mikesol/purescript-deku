module Deku.DOM.Attr.CalcMode where

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

data CalcMode = CalcMode

instance Attr Animate_ CalcMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr CalcMode bothValues = unsafeAttribute $ Both (pure 
    { key: "calcMode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "calcMode", value: prop' value })
instance Attr Animate_ CalcMode (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr CalcMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "calcMode", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "calcMode", value: prop' value })
instance Attr Animate_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute $ This $ pure $
    { key: "calcMode", value: prop' value }
instance Attr Animate_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }

instance Attr Animate_ CalcMode (ST.ST Global.Global  String ) where
  attr CalcMode iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "calcMode", value: prop' value }

instance Attr AnimateMotion_ CalcMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr CalcMode bothValues = unsafeAttribute $ Both (pure 
    { key: "calcMode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "calcMode", value: prop' value })
instance Attr AnimateMotion_ CalcMode (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr CalcMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "calcMode", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "calcMode", value: prop' value })
instance Attr AnimateMotion_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute $ This $ pure $
    { key: "calcMode", value: prop' value }
instance Attr AnimateMotion_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }

instance Attr AnimateMotion_ CalcMode (ST.ST Global.Global  String ) where
  attr CalcMode iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "calcMode", value: prop' value }

instance Attr AnimateTransform_ CalcMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr CalcMode bothValues = unsafeAttribute $ Both (pure 
    { key: "calcMode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "calcMode", value: prop' value })
instance Attr AnimateTransform_ CalcMode (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr CalcMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "calcMode", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "calcMode", value: prop' value })
instance Attr AnimateTransform_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute $ This $ pure $
    { key: "calcMode", value: prop' value }
instance Attr AnimateTransform_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }

instance Attr AnimateTransform_ CalcMode (ST.ST Global.Global  String ) where
  attr CalcMode iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "calcMode", value: prop' value }

instance Attr everything CalcMode (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr CalcMode bothValues = unsafeAttribute $ Both (pure 
    { key: "calcMode", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "calcMode", value: unset' })
instance Attr everything CalcMode (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr CalcMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "calcMode", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "calcMode", value: unset' })
instance Attr everything CalcMode  Unit  where
  attr CalcMode _ = unsafeAttribute $ This $ pure $
    { key: "calcMode", value: unset' }
instance Attr everything CalcMode (Event.Event  Unit ) where
  attr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "calcMode", value: unset' }

instance Attr everything CalcMode (ST.ST Global.Global  Unit ) where
  attr CalcMode iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "calcMode", value: unset' }
