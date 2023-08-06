module Deku.DOM.Attr.Headers where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Headers = Headers

instance Attr Td_ Headers  String  where
  attr Headers value = unsafeAttribute $ Left $  
    { key: "headers", value: prop' value }
instance Attr Td_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "headers", value: prop' value }


instance Attr Th_ Headers  String  where
  attr Headers value = unsafeAttribute $ Left $  
    { key: "headers", value: prop' value }
instance Attr Th_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "headers", value: prop' value }


instance Attr everything Headers  Unit  where
  attr Headers _ = unsafeAttribute $ Left $  { key: "headers", value: unset' }
instance Attr everything Headers (Event.Event  Unit ) where
  attr Headers eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "headers", value: unset' }
