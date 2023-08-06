module Deku.DOM.Attr.Hreflang where

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
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Hreflang = Hreflang

instance Attr A_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute $ Left $  
    { key: "hreflang", value: prop' value }
instance Attr A_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "hreflang", value: prop' value }


instance Attr Area_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute $ Left $  
    { key: "hreflang", value: prop' value }
instance Attr Area_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "hreflang", value: prop' value }


instance Attr Link_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute $ Left $  
    { key: "hreflang", value: prop' value }
instance Attr Link_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "hreflang", value: prop' value }


instance Attr everything Hreflang  Unit  where
  attr Hreflang _ = unsafeAttribute $ Left $  
    { key: "hreflang", value: unset' }
instance Attr everything Hreflang (Event.Event  Unit ) where
  attr Hreflang eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "hreflang", value: unset' }
