module Deku.DOM.Attr.TargetX where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX  String  where
  attr TargetX value = unsafeAttribute $ Left $  
    { key: "targetX", value: prop' value }
instance Attr FeConvolveMatrix_ TargetX (Event.Event  String ) where
  attr TargetX eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "targetX", value: prop' value }


instance Attr everything TargetX  Unit  where
  attr TargetX _ = unsafeAttribute $ Left $  { key: "targetX", value: unset' }
instance Attr everything TargetX (Event.Event  Unit ) where
  attr TargetX eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "targetX", value: unset' }
