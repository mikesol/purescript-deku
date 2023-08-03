module Deku.DOM.Attr.OnScroll where

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

data OnScroll = OnScroll

instance Attr anything OnScroll (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnScroll bothValues = unsafeAttribute $ Both (pure 
    { key: "scroll", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "scroll", value: cb' value })
instance Attr anything OnScroll (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnScroll (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "scroll", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "scroll", value: cb' value })
instance Attr anything OnScroll  Cb  where
  attr OnScroll value = unsafeAttribute $ This $ pure $
    { key: "scroll", value: cb' value }
instance Attr anything OnScroll (Event.Event  Cb ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scroll", value: cb' value }

instance Attr anything OnScroll (ST.ST Global.Global  Cb ) where
  attr OnScroll stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "scroll", value: cb' value }

instance Attr anything OnScroll (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnScroll bothValues = unsafeAttribute $ Both (pure 
    { key: "scroll", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "scroll", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnScroll (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnScroll (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "scroll", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "scroll", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnScroll  (Effect Unit)  where
  attr OnScroll value = unsafeAttribute $ This $ pure $
    { key: "scroll", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnScroll (Event.Event  (Effect Unit) ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (ST.ST Global.Global  (Effect Unit) ) where
  attr OnScroll stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnScroll bothValues = unsafeAttribute $ Both (pure 
    { key: "scroll", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "scroll", value: cb' (Cb (const value)) }
    )
instance Attr anything OnScroll (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnScroll (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "scroll", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "scroll", value: cb' (Cb (const value)) }
    )
instance Attr anything OnScroll  (Effect Boolean)  where
  attr OnScroll value = unsafeAttribute $ This $ pure $
    { key: "scroll", value: cb' (Cb (const value)) }
instance Attr anything OnScroll (Event.Event  (Effect Boolean) ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const value)) }

instance Attr anything OnScroll (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnScroll stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const value)) }

instance Attr everything OnScroll (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnScroll bothValues = unsafeAttribute $ Both (pure 
    { key: "scroll", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "scroll", value: unset' })
instance Attr everything OnScroll (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnScroll (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "scroll", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "scroll", value: unset' })
instance Attr everything OnScroll  Unit  where
  attr OnScroll _ = unsafeAttribute $ This $ pure $ { key: "scroll", value: unset' }
instance Attr everything OnScroll (Event.Event  Unit ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scroll", value: unset' }

instance Attr everything OnScroll (ST.ST Global.Global  Unit ) where
  attr OnScroll stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "scroll", value: unset' }
