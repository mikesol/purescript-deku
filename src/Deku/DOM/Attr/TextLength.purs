module Deku.DOM.Attr.TextLength where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TextLength = TextLength

instance Attr Text_ TextLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextLength bothValues = unsafeAttribute $ Both (pure 
    { key: "textLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "textLength", value: prop' value })
instance Attr Text_ TextLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "textLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "textLength", value: prop' value })
instance Attr Text_ TextLength  String  where
  attr TextLength value = unsafeAttribute $ This $ pure $
    { key: "textLength", value: prop' value }
instance Attr Text_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }

instance Attr Text_ TextLength (ST.ST Global.Global  String ) where
  attr TextLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "textLength", value: prop' value }

instance Attr TextPath_ TextLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextLength bothValues = unsafeAttribute $ Both (pure 
    { key: "textLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "textLength", value: prop' value })
instance Attr TextPath_ TextLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "textLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "textLength", value: prop' value })
instance Attr TextPath_ TextLength  String  where
  attr TextLength value = unsafeAttribute $ This $ pure $
    { key: "textLength", value: prop' value }
instance Attr TextPath_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }

instance Attr TextPath_ TextLength (ST.ST Global.Global  String ) where
  attr TextLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "textLength", value: prop' value }

instance Attr Tspan_ TextLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextLength bothValues = unsafeAttribute $ Both (pure 
    { key: "textLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "textLength", value: prop' value })
instance Attr Tspan_ TextLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "textLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "textLength", value: prop' value })
instance Attr Tspan_ TextLength  String  where
  attr TextLength value = unsafeAttribute $ This $ pure $
    { key: "textLength", value: prop' value }
instance Attr Tspan_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }

instance Attr Tspan_ TextLength (ST.ST Global.Global  String ) where
  attr TextLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "textLength", value: prop' value }

instance Attr everything TextLength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TextLength bothValues = unsafeAttribute $ Both (pure 
    { key: "textLength", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "textLength", value: unset' })
instance Attr everything TextLength (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr TextLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "textLength", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "textLength", value: unset' })
instance Attr everything TextLength  Unit  where
  attr TextLength _ = unsafeAttribute $ This $ pure $
    { key: "textLength", value: unset' }
instance Attr everything TextLength (Event.Event  Unit ) where
  attr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "textLength", value: unset' }

instance Attr everything TextLength (ST.ST Global.Global  Unit ) where
  attr TextLength iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "textLength", value: unset' }
