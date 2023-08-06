module Deku.DOM.Attr.Ismap where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ismap = Ismap

instance Attr Img_ Ismap  String  where
  attr Ismap value = unsafeAttribute $ Left $  
    { key: "ismap", value: prop' value }
instance Attr Img_ Ismap (Event.Event  String ) where
  attr Ismap eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ismap", value: prop' value }


instance Attr everything Ismap  Unit  where
  attr Ismap _ = unsafeAttribute $ Left $  { key: "ismap", value: unset' }
instance Attr everything Ismap (Event.Event  Unit ) where
  attr Ismap eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "ismap", value: unset' }
