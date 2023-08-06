module Deku.DOM.Attr.K3 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K3 = K3

instance Attr FeComposite_ K3  String  where
  attr K3 value = unsafeAttribute $ Left $  { key: "k3", value: prop' value }
instance Attr FeComposite_ K3 (Event.Event  String ) where
  attr K3 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "k3", value: prop' value }


instance Attr everything K3  Unit  where
  attr K3 _ = unsafeAttribute $ Left $  { key: "k3", value: unset' }
instance Attr everything K3 (Event.Event  Unit ) where
  attr K3 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "k3", value: unset' }
