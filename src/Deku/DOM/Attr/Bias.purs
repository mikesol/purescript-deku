module Deku.DOM.Attr.Bias where

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

data Bias = Bias

instance Attr FeConvolveMatrix_ Bias  String  where
  attr Bias value = unsafeAttribute $ Left $  
    { key: "bias", value: prop' value }
instance Attr FeConvolveMatrix_ Bias (Event.Event  String ) where
  attr Bias eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "bias", value: prop' value }


instance Attr everything Bias  Unit  where
  attr Bias _ = unsafeAttribute $ Left $  { key: "bias", value: unset' }
instance Attr everything Bias (Event.Event  Unit ) where
  attr Bias eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "bias", value: unset' }
