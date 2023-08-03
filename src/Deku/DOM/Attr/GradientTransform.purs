module Deku.DOM.Attr.GradientTransform where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientTransform = GradientTransform

instance Attr LinearGradient_ GradientTransform (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientTransform", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gradientTransform", value: prop' value }
    )
instance Attr LinearGradient_ GradientTransform (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr GradientTransform (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "gradientTransform", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "gradientTransform", value: prop' value }
    )
instance Attr LinearGradient_ GradientTransform  String  where
  attr GradientTransform value = unsafeAttribute $ This $ pure $
    { key: "gradientTransform", value: prop' value }
instance Attr LinearGradient_ GradientTransform (Event.Event  String ) where
  attr GradientTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "gradientTransform", value: prop' value }

instance Attr LinearGradient_ GradientTransform (ST.ST Global.Global  String ) where
  attr GradientTransform stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "gradientTransform", value: prop' value }

instance Attr RadialGradient_ GradientTransform (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientTransform", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gradientTransform", value: prop' value }
    )
instance Attr RadialGradient_ GradientTransform (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr GradientTransform (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "gradientTransform", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "gradientTransform", value: prop' value }
    )
instance Attr RadialGradient_ GradientTransform  String  where
  attr GradientTransform value = unsafeAttribute $ This $ pure $
    { key: "gradientTransform", value: prop' value }
instance Attr RadialGradient_ GradientTransform (Event.Event  String ) where
  attr GradientTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "gradientTransform", value: prop' value }

instance Attr RadialGradient_ GradientTransform (ST.ST Global.Global  String ) where
  attr GradientTransform stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "gradientTransform", value: prop' value }

instance Attr everything GradientTransform (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr GradientTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientTransform", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "gradientTransform", value: unset' })
instance Attr everything GradientTransform (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr GradientTransform (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "gradientTransform", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "gradientTransform", value: unset' })
instance Attr everything GradientTransform  Unit  where
  attr GradientTransform _ = unsafeAttribute $ This $ pure $
    { key: "gradientTransform", value: unset' }
instance Attr everything GradientTransform (Event.Event  Unit ) where
  attr GradientTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "gradientTransform", value: unset' }

instance Attr everything GradientTransform (ST.ST Global.Global  Unit ) where
  attr GradientTransform stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "gradientTransform", value: unset' }
