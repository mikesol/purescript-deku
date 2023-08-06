module Deku.DOM.Attr.Manifest where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Html (Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Manifest = Manifest

instance Attr Html_ Manifest (NonEmpty.NonEmpty Event.Event  String ) where
  attr Manifest bothValues = unsafeAttribute $ Both (pure 
    { key: "manifest", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "manifest", value: prop' value })
instance Attr Html_ Manifest (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Manifest (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "manifest", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "manifest", value: prop' value })
instance Attr Html_ Manifest  String  where
  attr Manifest value = unsafeAttribute $ This $ pure $
    { key: "manifest", value: prop' value }
instance Attr Html_ Manifest (Event.Event  String ) where
  attr Manifest eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "manifest", value: prop' value }

instance Attr Html_ Manifest (ST.ST Global.Global  String ) where
  attr Manifest iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "manifest", value: prop' value }

instance Attr everything Manifest (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Manifest bothValues = unsafeAttribute $ Both (pure 
    { key: "manifest", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "manifest", value: unset' })
instance Attr everything Manifest (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Manifest (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "manifest", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "manifest", value: unset' })
instance Attr everything Manifest  Unit  where
  attr Manifest _ = unsafeAttribute $ This $ pure $
    { key: "manifest", value: unset' }
instance Attr everything Manifest (Event.Event  Unit ) where
  attr Manifest eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "manifest", value: unset' }

instance Attr everything Manifest (ST.ST Global.Global  Unit ) where
  attr Manifest iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "manifest", value: unset' }
