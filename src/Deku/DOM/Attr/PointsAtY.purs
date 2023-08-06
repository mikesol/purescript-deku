module Deku.DOM.Attr.PointsAtY where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtY = PointsAtY

instance Attr FeSpotLight_ PointsAtY  String  where
  attr PointsAtY value = unsafeAttribute $ Left $  
    { key: "pointsAtY", value: prop' value }
instance Attr FeSpotLight_ PointsAtY (Event.Event  String ) where
  attr PointsAtY eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointsAtY", value: prop' value }


instance Attr everything PointsAtY  Unit  where
  attr PointsAtY _ = unsafeAttribute $ Left $  
    { key: "pointsAtY", value: unset' }
instance Attr everything PointsAtY (Event.Event  Unit ) where
  attr PointsAtY eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointsAtY", value: unset' }
