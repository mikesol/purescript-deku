module Deku.DOM.Attr.PointsAtZ where

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

data PointsAtZ = PointsAtZ

instance Attr FeSpotLight_ PointsAtZ  String  where
  attr PointsAtZ value = unsafeAttribute $ Left $  
    { key: "pointsAtZ", value: prop' value }
instance Attr FeSpotLight_ PointsAtZ (Event.Event  String ) where
  attr PointsAtZ eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointsAtZ", value: prop' value }


instance Attr everything PointsAtZ  Unit  where
  attr PointsAtZ _ = unsafeAttribute $ Left $  
    { key: "pointsAtZ", value: unset' }
instance Attr everything PointsAtZ (Event.Event  Unit ) where
  attr PointsAtZ eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointsAtZ", value: unset' }
