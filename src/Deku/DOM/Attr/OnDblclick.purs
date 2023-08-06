module Deku.DOM.Attr.OnDblclick where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDblclick = OnDblclick

instance Attr anything OnDblclick (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both (pure 
    { key: "dblclick", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dblclick", value: cb' value })
instance Attr anything OnDblclick (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnDblclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dblclick", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dblclick", value: cb' value })
instance Attr anything OnDblclick  Cb  where
  attr OnDblclick value = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: cb' value }
instance Attr anything OnDblclick (Event.Event  Cb ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dblclick", value: cb' value }

instance Attr anything OnDblclick (ST.ST Global.Global  Cb ) where
  attr OnDblclick iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dblclick", value: cb' value }

instance Attr anything OnDblclick (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both (pure 
    { key: "dblclick", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dblclick", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDblclick (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnDblclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dblclick", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dblclick", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDblclick  (Effect Unit)  where
  attr OnDblclick value = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDblclick (Event.Event  (Effect Unit) ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDblclick (ST.ST Global.Global  (Effect Unit) ) where
  attr OnDblclick iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dblclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDblclick (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both (pure 
    { key: "dblclick", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dblclick", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDblclick (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnDblclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dblclick", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dblclick", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDblclick  (Effect Boolean)  where
  attr OnDblclick value = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: cb' (Cb (const value)) }
instance Attr anything OnDblclick (Event.Event  (Effect Boolean) ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const value)) }

instance Attr anything OnDblclick (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnDblclick iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dblclick", value: cb' (Cb (const value)) }

instance Attr everything OnDblclick (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both (pure 
    { key: "dblclick", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dblclick", value: unset' })
instance Attr everything OnDblclick (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnDblclick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "dblclick", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dblclick", value: unset' })
instance Attr everything OnDblclick  Unit  where
  attr OnDblclick _ = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: unset' }
instance Attr everything OnDblclick (Event.Event  Unit ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dblclick", value: unset' }

instance Attr everything OnDblclick (ST.ST Global.Global  Unit ) where
  attr OnDblclick iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "dblclick", value: unset' }
