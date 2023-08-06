module Deku.DOM.Attr.Ping where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ping = Ping

instance Attr A_ Ping  String  where
  attr Ping value = unsafeAttribute $ Left $  
    { key: "ping", value: prop' value }
instance Attr A_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "ping", value: prop' value }


instance Attr Area_ Ping  String  where
  attr Ping value = unsafeAttribute $ Left $  
    { key: "ping", value: prop' value }
instance Attr Area_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "ping", value: prop' value }


instance Attr everything Ping  Unit  where
  attr Ping _ = unsafeAttribute $ Left $  { key: "ping", value: unset' }
instance Attr everything Ping (Event.Event  Unit ) where
  attr Ping eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "ping", value: unset' }
