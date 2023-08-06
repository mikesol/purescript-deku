module Deku.DOM.Attr.GradientTransform where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientTransform = GradientTransform

instance Attr LinearGradient_ GradientTransform  String  where
  attr GradientTransform value = unsafeAttribute $ Left $  
    { key: "gradientTransform", value: prop' value }
instance Attr LinearGradient_ GradientTransform (Event.Event  String ) where
  attr GradientTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "gradientTransform", value: prop' value }


instance Attr RadialGradient_ GradientTransform  String  where
  attr GradientTransform value = unsafeAttribute $ Left $  
    { key: "gradientTransform", value: prop' value }
instance Attr RadialGradient_ GradientTransform (Event.Event  String ) where
  attr GradientTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "gradientTransform", value: prop' value }


instance Attr everything GradientTransform  Unit  where
  attr GradientTransform _ = unsafeAttribute $ Left $  
    { key: "gradientTransform", value: unset' }
instance Attr everything GradientTransform (Event.Event  Unit ) where
  attr GradientTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "gradientTransform", value: unset' }
