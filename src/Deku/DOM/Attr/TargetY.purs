module Deku.DOM.Attr.TargetY where

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

data TargetY = TargetY

instance Attr FeConvolveMatrix_ TargetY  String  where
  attr TargetY value = unsafeAttribute $ Left $  
    { key: "targetY", value: prop' value }
instance Attr FeConvolveMatrix_ TargetY (Event.Event  String ) where
  attr TargetY eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "targetY", value: prop' value }


instance Attr everything TargetY  Unit  where
  attr TargetY _ = unsafeAttribute $ Left $  { key: "targetY", value: unset' }
instance Attr everything TargetY (Event.Event  Unit ) where
  attr TargetY eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "targetY", value: unset' }
