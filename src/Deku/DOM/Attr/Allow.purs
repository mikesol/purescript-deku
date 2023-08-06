module Deku.DOM.Attr.Allow where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Allow = Allow

instance Attr Iframe_ Allow  String  where
  attr Allow value = unsafeAttribute $ Left $  
    { key: "allow", value: prop' value }
instance Attr Iframe_ Allow (Event.Event  String ) where
  attr Allow eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "allow", value: prop' value }


instance Attr everything Allow  Unit  where
  attr Allow _ = unsafeAttribute $ Left $  { key: "allow", value: unset' }
instance Attr everything Allow (Event.Event  Unit ) where
  attr Allow eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "allow", value: unset' }
