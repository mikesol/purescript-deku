module Deku.DOM.Attr.Spacing where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Spacing = Spacing

instance Attr TextPath_ Spacing  String  where
  attr Spacing value = unsafeAttribute $ Left $  
    { key: "spacing", value: prop' value }
instance Attr TextPath_ Spacing (Event.Event  String ) where
  attr Spacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "spacing", value: prop' value }


instance Attr everything Spacing  Unit  where
  attr Spacing _ = unsafeAttribute $ Left $  { key: "spacing", value: unset' }
instance Attr everything Spacing (Event.Event  Unit ) where
  attr Spacing eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "spacing", value: unset' }
