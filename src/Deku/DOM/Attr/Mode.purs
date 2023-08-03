module Deku.DOM.Attr.Mode where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Mode = Mode

instance Attr FeBlend_ Mode (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mode bothValues = unsafeAttribute $ Both (pure 
    { key: "mode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mode", value: prop' value })
instance Attr FeBlend_ Mode (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mode", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mode", value: prop' value })
instance Attr FeBlend_ Mode  String  where
  attr Mode value = unsafeAttribute $ This $ pure $
    { key: "mode", value: prop' value }
instance Attr FeBlend_ Mode (Event.Event  String ) where
  attr Mode eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mode", value: prop' value }

instance Attr FeBlend_ Mode (ST.ST Global.Global  String ) where
  attr Mode stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mode", value: prop' value }

instance Attr everything Mode (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Mode bothValues = unsafeAttribute $ Both (pure  { key: "mode", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mode", value: unset' })
instance Attr everything Mode (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Mode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "mode", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mode", value: unset' })
instance Attr everything Mode  Unit  where
  attr Mode _ = unsafeAttribute $ This $ pure $ { key: "mode", value: unset' }
instance Attr everything Mode (Event.Event  Unit ) where
  attr Mode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "mode", value: unset' }

instance Attr everything Mode (ST.ST Global.Global  Unit ) where
  attr Mode stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "mode", value: unset' }
