module Deku.DOM.Attr.PointsAtX where

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

data PointsAtX = PointsAtX

instance Attr FeSpotLight_ PointsAtX  String  where
  attr PointsAtX value = unsafeAttribute $ Left $  
    { key: "pointsAtX", value: prop' value }
instance Attr FeSpotLight_ PointsAtX (Event.Event  String ) where
  attr PointsAtX eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointsAtX", value: prop' value }


instance Attr everything PointsAtX  Unit  where
  attr PointsAtX _ = unsafeAttribute $ Left $  
    { key: "pointsAtX", value: unset' }
instance Attr everything PointsAtX (Event.Event  Unit ) where
  attr PointsAtX eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointsAtX", value: unset' }
