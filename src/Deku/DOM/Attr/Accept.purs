module Deku.DOM.Attr.Accept where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accept = Accept

instance Attr Form_ Accept  String  where
  attr Accept value = unsafeAttribute $ Left $  
    { key: "accept", value: prop' value }
instance Attr Form_ Accept (Event.Event  String ) where
  attr Accept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "accept", value: prop' value }


instance Attr Input_ Accept  String  where
  attr Accept value = unsafeAttribute $ Left $  
    { key: "accept", value: prop' value }
instance Attr Input_ Accept (Event.Event  String ) where
  attr Accept eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "accept", value: prop' value }


instance Attr everything Accept  Unit  where
  attr Accept _ = unsafeAttribute $ Left $  { key: "accept", value: unset' }
instance Attr everything Accept (Event.Event  Unit ) where
  attr Accept eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "accept", value: unset' }
