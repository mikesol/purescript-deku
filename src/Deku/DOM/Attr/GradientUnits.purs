module Deku.DOM.Attr.GradientUnits where

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

data GradientUnits = GradientUnits

instance Attr LinearGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute $ Left $  
    { key: "gradientUnits", value: prop' value }
instance Attr LinearGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }


instance Attr RadialGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute $ Left $  
    { key: "gradientUnits", value: prop' value }
instance Attr RadialGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }


instance Attr everything GradientUnits  Unit  where
  attr GradientUnits _ = unsafeAttribute $ Left $  
    { key: "gradientUnits", value: unset' }
instance Attr everything GradientUnits (Event.Event  Unit ) where
  attr GradientUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "gradientUnits", value: unset' }
