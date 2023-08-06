module Deku.DOM.Attr.Alt where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Alt = Alt

instance Attr Applet_ Alt  String  where
  attr Alt value = unsafeAttribute $ Left $  { key: "alt", value: prop' value }
instance Attr Applet_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "alt", value: prop' value }


instance Attr Area_ Alt  String  where
  attr Alt value = unsafeAttribute $ Left $  { key: "alt", value: prop' value }
instance Attr Area_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "alt", value: prop' value }


instance Attr Img_ Alt  String  where
  attr Alt value = unsafeAttribute $ Left $  { key: "alt", value: prop' value }
instance Attr Img_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "alt", value: prop' value }


instance Attr Input_ Alt  String  where
  attr Alt value = unsafeAttribute $ Left $  { key: "alt", value: prop' value }
instance Attr Input_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "alt", value: prop' value }


instance Attr everything Alt  Unit  where
  attr Alt _ = unsafeAttribute $ Left $  { key: "alt", value: unset' }
instance Attr everything Alt (Event.Event  Unit ) where
  attr Alt eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "alt", value: unset' }
