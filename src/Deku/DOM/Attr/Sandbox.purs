module Deku.DOM.Attr.Sandbox where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox (NonEmpty.NonEmpty Event.Event  String ) where
  attr Sandbox bothValues = unsafeAttribute $ Both (pure 
    { key: "sandbox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "sandbox", value: prop' value })
instance Attr Iframe_ Sandbox (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Sandbox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "sandbox", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "sandbox", value: prop' value })
instance Attr Iframe_ Sandbox  String  where
  attr Sandbox value = unsafeAttribute $ This $ pure $
    { key: "sandbox", value: prop' value }
instance Attr Iframe_ Sandbox (Event.Event  String ) where
  attr Sandbox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sandbox", value: prop' value }

instance Attr Iframe_ Sandbox (ST.ST Global.Global  String ) where
  attr Sandbox iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "sandbox", value: prop' value }

instance Attr everything Sandbox (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Sandbox bothValues = unsafeAttribute $ Both (pure 
    { key: "sandbox", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "sandbox", value: unset' })
instance Attr everything Sandbox (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Sandbox (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "sandbox", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "sandbox", value: unset' })
instance Attr everything Sandbox  Unit  where
  attr Sandbox _ = unsafeAttribute $ This $ { key: "sandbox", value: unset' }
instance Attr everything Sandbox (Event.Event  Unit ) where
  attr Sandbox eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "sandbox", value: unset' }

instance Attr everything Sandbox (ST.ST Global.Global  Unit ) where
  attr Sandbox iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "sandbox", value: unset' }
