module Deku.DOM.Attr.Elevation where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Elevation = Elevation

instance Attr FeDistantLight_ Elevation  String  where
  attr Elevation value = unsafeAttribute $ Left $  
    { key: "elevation", value: prop' value }
instance Attr FeDistantLight_ Elevation (Event.Event  String ) where
  attr Elevation eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "elevation", value: prop' value }


instance Attr everything Elevation  Unit  where
  attr Elevation _ = unsafeAttribute $ Left $  
    { key: "elevation", value: unset' }
instance Attr everything Elevation (Event.Event  Unit ) where
  attr Elevation eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "elevation", value: unset' }
