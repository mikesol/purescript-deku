module Deku.DOM.Attr.Mode where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Mode = Mode

instance Attr FeBlend_ Mode  String  where
  attr Mode value = unsafeAttribute $ Left $  
    { key: "mode", value: prop' value }
instance Attr FeBlend_ Mode (Event.Event  String ) where
  attr Mode eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "mode", value: prop' value }


instance Attr everything Mode  Unit  where
  attr Mode _ = unsafeAttribute $ Left $  { key: "mode", value: unset' }
instance Attr everything Mode (Event.Event  Unit ) where
  attr Mode eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "mode", value: unset' }
