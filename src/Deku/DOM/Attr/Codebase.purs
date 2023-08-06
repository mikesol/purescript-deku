module Deku.DOM.Attr.Codebase where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Codebase = Codebase

instance Attr Applet_ Codebase  String  where
  attr Codebase value = unsafeAttribute $ Left $  
    { key: "codebase", value: prop' value }
instance Attr Applet_ Codebase (Event.Event  String ) where
  attr Codebase eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "codebase", value: prop' value }


instance Attr everything Codebase  Unit  where
  attr Codebase _ = unsafeAttribute $ Left $  
    { key: "codebase", value: unset' }
instance Attr everything Codebase (Event.Event  Unit ) where
  attr Codebase eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "codebase", value: unset' }
