module Deku.DOM.Attr.Target where

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
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Target = Target

instance Attr A_ Target  String  where
  attr Target value = unsafeAttribute $ Left $  
    { key: "target", value: prop' value }
instance Attr A_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "target", value: prop' value }


instance Attr Area_ Target  String  where
  attr Target value = unsafeAttribute $ Left $  
    { key: "target", value: prop' value }
instance Attr Area_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "target", value: prop' value }


instance Attr Base_ Target  String  where
  attr Target value = unsafeAttribute $ Left $  
    { key: "target", value: prop' value }
instance Attr Base_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "target", value: prop' value }


instance Attr Form_ Target  String  where
  attr Target value = unsafeAttribute $ Left $  
    { key: "target", value: prop' value }
instance Attr Form_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "target", value: prop' value }


instance Attr everything Target  Unit  where
  attr Target _ = unsafeAttribute $ Left $  { key: "target", value: unset' }
instance Attr everything Target (Event.Event  Unit ) where
  attr Target eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "target", value: unset' }
