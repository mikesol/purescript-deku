module Deku.DOM.Attr.Sandbox where

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

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox  String  where
  attr Sandbox value = unsafeAttribute $ Left $  
    { key: "sandbox", value: prop' value }
instance Attr Iframe_ Sandbox (Event.Event  String ) where
  attr Sandbox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "sandbox", value: prop' value }


instance Attr everything Sandbox  Unit  where
  attr Sandbox _ = unsafeAttribute $ Left $  { key: "sandbox", value: unset' }
instance Attr everything Sandbox (Event.Event  Unit ) where
  attr Sandbox eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "sandbox", value: unset' }
